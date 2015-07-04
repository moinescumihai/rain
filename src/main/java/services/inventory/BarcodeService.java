package services.inventory;

import com.google.zxing.BarcodeFormat;
import java.io.File;

public interface BarcodeService {
    boolean encode(File file, String contents, BarcodeFormat barcodeFormat) throws Exception;

    String decode(File file) throws Exception;
}
