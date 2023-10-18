package validators;

import java.util.Objects;

public class Validator implements IValidator {
    @Override
    public boolean validateX(String xString) {
        if (Objects.isNull(xString) || xString.isEmpty()) return false;
        try {
            int x = Integer.parseInt(xString);
            return x >= -5 && x <= 3;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    @Override
    public boolean validateY(String yString) {
        if (Objects.isNull(yString) || yString.isEmpty()) return false;
        try {
            double x = Double.parseDouble(yString);
            return x >= -3 && x <= 3;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    @Override
    public boolean validateR(String rString) {
        if (Objects.isNull(rString) || rString.isEmpty()) return false;
        try {
            int x = Integer.parseInt(rString);
            return x >= 1 && x <= 5;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    @Override
    public boolean isHit(String xString, String yString, String rString) {
        int x = Integer.parseInt(xString);
        double y = Double.parseDouble(yString);
        int r = Integer.parseInt(rString);

        if(x >= 0 && y >= 0 && x <= r / 2 && y <= (double) r / 2) return true;
        if(x >= 0 && y <= 0 && x*x + y*y <= r*r) return true;
        if(x <= 0 && y <= 0 && x < r/2 && y > -r) return true;
        return false;
    }
}
