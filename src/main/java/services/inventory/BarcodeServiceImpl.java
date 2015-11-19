package services.inventory;

import com.google.zxing.*;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.HybridBinarizer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

@Service
public class BarcodeServiceImpl implements BarcodeService{
    private static final Logger LOGGER = LoggerFactory.getLogger(BarcodeServiceImpl.class);

    private static BarcodeFormat DEFAULT_BARCODE_FORMAT = BarcodeFormat.CODE_128;

    /**
     * Given the <code>contents</code>, it will encode them into a png <code>file</code>
     * into the specified <code>barcodeFormat</code>
     *
     * @param file          the file to become barcode
     * @param contents      the contents to be encoded.
     * @param barcodeFormat barcode or qr
     */
    @Override
    public boolean encode(File file, String contents, BarcodeFormat barcodeFormat) {
        boolean retVal;
        int width;
        int height;
        if (barcodeFormat == null) {
            barcodeFormat = DEFAULT_BARCODE_FORMAT;
        }
        if (file == null || file.getName().trim().isEmpty()) {
            throw new IllegalArgumentException("File not found, or invalid file name.");
        }
        if (contents == null || contents.trim().isEmpty()) {
            throw new IllegalArgumentException("Can't encode null or empty contents.");
        }
        switch (barcodeFormat) {
            case CODE_128:
                width = 200;
                height = 100;
                break;
            case QR_CODE:
                width = 300;
                height = 300;
                break;
            default:
                width = 200;
                height = 100;
                break;
        }

        try {
            MultiFormatWriter barcodeWriter = new MultiFormatWriter();
            FileOutputStream outputStream = new FileOutputStream(file);
            BitMatrix matrix = barcodeWriter.encode(contents, barcodeFormat, width, height);
            String imageFormat = file.getName().substring(file.getName().indexOf(".") + 1);
            MatrixToImageWriter.writeToStream(matrix, imageFormat, outputStream);
            outputStream.close();
            retVal = true;

        } catch (Exception e) {
            LOGGER.debug(e.getMessage(), e);
            retVal = false;
        }

        return retVal;
    }

    /**
     * Decode method used to read image or barcode itself, and recognize the barcode,
     * get the encoded contents and returns it.
     *
     * @param file image that needs to be read.
     * @return decoded results from barcode.
     */
    @Override
    public String decode(File file) throws Exception {
        // check the required parameters
        if (file == null || file.getName().trim().isEmpty()) {
            throw new IllegalArgumentException("File not found, or invalid file name.");
        }
        BufferedImage image;
        try {
            image = ImageIO.read(file);
        } catch (IOException e) {
            LOGGER.error(e.getLocalizedMessage(), e);
            throw new Exception(e.getMessage());
        }
        if (image == null) {
            throw new IllegalArgumentException("Could not decode image.");
        }
        LuminanceSource source = new BufferedImageLuminanceSource(image);
        BinaryBitmap bitmap = new BinaryBitmap(new HybridBinarizer(source));
        MultiFormatReader barcodeReader = new MultiFormatReader();
        Result result;
        String code;
        try {
            result = barcodeReader.decode(bitmap);
            // setting results.
            code = String.valueOf(result.getText());
        } catch (Exception e) {
            LOGGER.debug(e.getMessage(), e);
            throw new RuntimeException(e.getMessage());
        }
        return code;
    }
}
