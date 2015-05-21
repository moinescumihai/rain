package common.validator;
import org.joda.time.DateTime;
import org.joda.time.Duration;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Validates if two given dates are within a valid date range.
 *
 *
 */
public class DateRangeValidator implements ConstraintValidator<DateRange, Object> {

    private static final double MILLILSPERDAY = 86400000.0;

    /**
     * {@inheritDoc}
     *
     * @see ConstraintValidator#isValid(Object,
     *      ConstraintValidatorContext)
     */
    public final boolean isValid(final Object instance, final ConstraintValidatorContext ctx) {
        List<Field> startDateFields = new ArrayList<Field>();
        List<Field> endDateFields = new ArrayList<Field>();

        annotatedFields(instance, startDateFields, endDateFields);

        if (startDateFields.isEmpty() || endDateFields.isEmpty()) {
            return true;
        }

        HashMap<Integer, Interval> intervals = new HashMap<Integer, Interval>();

        try {
            for (Field field : startDateFields) {
                int idAnnotated = idFromStartDate(field);
                intervals.put(idAnnotated, new Interval(calendarInstanceFromField(instance, field)));
            }

            for (Field field : endDateFields) {
                int idAnnotated = idFromEndDate(field);
                long expectedInterval = field.getAnnotation(EndDate.class).minimumDaysRange();
                long[] allowedRanges = field.getAnnotation(EndDate.class).allowedDayRanges();
                Interval intervalWithStartDate = intervals.get(idAnnotated);

                intervalWithStartDate.intervalLimitInformation(calendarInstanceFromField(instance, field),
                        expectedInterval, allowedRanges);
            }
        } catch (IllegalAccessException e) {
            throw new RuntimeException("This should never happen. If so, please report a bug!", e);
        }

        for (Interval interval : intervals.values()) {
            if (!interval.isValid()) {
                return false;
            }
        }

        return true;
    }

    private void annotatedFields(final Object instance, final List<Field> startDateFields,
                                 final List<Field> endDateFields) {
        Field[] allModelFields = instance.getClass().getDeclaredFields();
        for (Field field : allModelFields) {
            if (containsAnnotation(field, StartDate.class)) {
                startDateFields.add(field);
            }
            if (containsAnnotation(field, EndDate.class)) {
                endDateFields.add(field);
            }
        }
    }

    private int idFromStartDate(final Field field) {
        return field.getAnnotation(StartDate.class).id();
    }

    private int idFromEndDate(final Field field) {
        return field.getAnnotation(EndDate.class).id();
    }

    private Object calendarInstanceFromField(final Object instance, final Field field) throws IllegalAccessException {
        field.setAccessible(true);
        return field.get(instance);
    }

    private boolean containsAnnotation(final Field field, final Class<? extends Annotation> annotation) {
        return field.getAnnotation(annotation) != null;
    }

    /**
     * {@inheritDoc}
     *
     * @see ConstraintValidator#initialize(Annotation)
     */
    public void initialize(final DateRange annotation) {

    }

    private class Interval {
        private DateTime startDate;
        private DateTime endDate;
        private long expectedDaysInterval;
        private long[] allowedRanges = { };
        private boolean duplicatedEndDate;

        /**
         *
         * @param startDate
         *            the lower range boundary
         */
        public Interval(final Object startDate) {
            if (startDate != null) {
                this.startDate = new DateTime(startDate);
            }
        }

        /**
         *
         * @return true if the expected minimum range is lower than the exact
         *         range or the exact interval is contained in the list of
         *         allowed ranges or one of boundaries is null or the end date
         *         can't be determined otherwise false
         */
        public boolean isValid() {
            if (duplicatedEndDate || endDate == null || startDate == null) {
                return true;
            }
            Duration duration = new Duration(startDate, endDate);

            // Rounding fixes #1
            long durationInDays = Math.round(duration.getMillis() / MILLILSPERDAY);

            if (this.allowedRanges.length == 0) {
                return durationInDays >= expectedDaysInterval;
            } else {
                for (int i = 0; i < this.allowedRanges.length; i++) {
                    if (this.allowedRanges[i] == durationInDays) {
                        return true;
                    }
                }
                return false;
            }
        }

        /**
         * Writes the variables needed to determine if an interval is valid or not.
         * Call this method for each upper boundary.
         *
         * If allowedRanges is empty, expectedDaysInterval will be used, otherwise the
         * information in allowedRanges, but not both.
         *
         * @param endDate the upper boundary
         * @param expectedDaysInterval the minimum range
         * @param allowedRanges an empty array or a list of allowed ranges
         */
        public void intervalLimitInformation(final Object endDate, final long expectedDaysInterval,
                                             final long[] allowedRanges) {

            if (this.endDate == null) {
                if (endDate != null) {
                    this.endDate = new DateTime(endDate);
                }
                if (allowedRanges.length == 0) {
                    this.expectedDaysInterval = expectedDaysInterval;
                } else {
                    this.allowedRanges = allowedRanges;
                }
            } else {
                duplicatedEndDate = true;
            }
        }
    }
}