package common.validator;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;


@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface EndDate {

    int id() default 0;

    long minimumDaysRange() default Long.MAX_VALUE;

    long[] allowedDayRanges() default {};
}