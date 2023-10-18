package validators;

import jakarta.servlet.http.HttpServletRequest;

public interface IValidator {
    static boolean checkFormat(HttpServletRequest req){
        return !req.getParameter("X").isEmpty() && !req.getParameter("Y").isEmpty() && !req.getParameter("R").isEmpty();
    }
    boolean validateX(String xString);
    boolean validateY(String yString);
    boolean validateR(String rString);
    boolean isHit(String xString, String yString, String rString);
    default HitStatus getStatus(HttpServletRequest req){
        if(!validateX(req.getParameter("X")) || !validateY(req.getParameter("Y")) || !validateR(req.getParameter("Z"))){
            return HitStatus.NOT_VALIDATED;
        }
        if(isHit(req.getParameter("X"), req.getParameter("Y"), req.getParameter("R"))){
            return HitStatus.HIT;
        }
        return HitStatus.MISS;
    }
}
