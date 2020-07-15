package pl.coderslab.charity;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.model.CurrentUser;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;
import pl.coderslab.charity.repository.UserRepository;

import java.security.Principal;


@Controller
public class HomeController {
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;



    public HomeController(InstitutionRepository institutionRepository, DonationRepository donationRepository) {
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;

    }


    @RequestMapping("/")
    public String homeAction(Model model, User user) {
        model.addAttribute("institutions", institutionRepository.findAll());
        model.addAttribute("sumofbags", donationRepository.sumOfBags());
        model.addAttribute("sumofdonations", donationRepository.count());

        return "index";
    }

    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String login() {
        return "login";
    }


//    @RequestMapping("/dashboard")
//    public String differentPages(@AuthenticationPrincipal CurrentUser currentUser){
//        if(currentUser.getAuthorities().equals("ROLE_ADMIN")){
//            return "redirect:/admin/dashboard";
//        } else if(currentUser.getAuthorities().equals("ROLE_USER")){
//            return "redirect:/user/dashboard";
//        }
//        return "error";
//    }


//    //dlaczego to nie działa?
//    @GetMapping("/dashboard")
//    public String loginAction(@AuthenticationPrincipal CurrentUser currentUser) {
//        if (currentUser.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_ADMIN"))) {
//            return "redirect:/admin/dashboard";
//        } else if (currentUser.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_USER"))) {
//            return "redirect:/user/dashboard";
//        }
//        return null;
//    }

    @RequestMapping("/user/dashboard")
    public String userDash(){
        return "/user/dashboard";
    }
    @RequestMapping("/admin/dashboard")
    public String adminDash(){
        return "/admin/dashboard";
    }
}
