package pl.coderslab.charity.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.model.CurrentUser;
import pl.coderslab.charity.repository.InstitutionRepository;
import pl.coderslab.charity.repository.UserRepository;

import java.util.Optional;


@Controller
@RequestMapping("/admin")
public class AdminController {
    private final UserRepository userRepository;
    private final InstitutionRepository institutionRepository;

    public AdminController(UserRepository userRepository, InstitutionRepository institutionRepository) {
        this.userRepository = userRepository;
        this.institutionRepository = institutionRepository;
    }


//    <li>Zarządzanie fundacjami</li>
    @GetMapping("/institutionManager")
    public String institutionManager(Model model){
        model.addAttribute("institutions", institutionRepository.findAll());
        return "/admin/institutionManager";
    }

//    <li>Zarządzanie administratorami</li>
//    @GetMapping("/adminManager")
//    <li>Zarządzanie użytkownikami</li>
@RequestMapping("/userManager")
public String userManager(Model model){
    model.addAttribute("users", userRepository.findAll());
    return "/admin/userManager";
}

    //Może to pomoże do przekierowania
//    @GetMapping("/login")
//    public String getAdminPanel(@AuthenticationPrincipal CurrentUser currentUser, Model model) {
//        model.addAttribute("admin", currentUser.getUser());
//        return "/admin/dashboard";
//    }

    //Dodawanie instytucji
    @GetMapping("/institutionAdd")
    public String institutionForm(@AuthenticationPrincipal User user, Model model){
        model.addAttribute("institution", new Institution());
        //powinno zapisywać nickname osoby, która dodała instytucję czy nie?
//        model.addAttribute("admin", user.getUsername());
        return "admin/institutionForm";
    }

    //Metoda post dodawania
    @PostMapping("/institutionAdd")
    public String addInstitution(@ModelAttribute Institution institution) {
        institutionRepository.save(institution);
        return "redirect:/admin/dashboard";
    }

    //Edycja użytkownika
    @GetMapping("/institutionEdit/{id}")
    public String editInstitution(@PathVariable Long id, Model model){
        model.addAttribute("institutionToEdit", institutionRepository.findById(id).get());
        return "/admin/institutionEdit";
    }

    //Metoda post edycji
    @PostMapping("/institutionEdit/{id}")
    public String editInstitution(@ModelAttribute Institution institution, @PathVariable Long id){
        Institution institutionFromDb = institutionRepository.findById(id).get();
        institutionFromDb.setDescription(institution.getDescription());
        institutionFromDb.setName(institution.getName());
        institutionRepository.save(institutionFromDb);
        return "redirect:/admin/institutionManager";
    }

    @GetMapping("/institutionDelete/{id}")
    public String deleteInstitution(@PathVariable Long id){
        institutionRepository.deleteById(id);
        return "redirect:/admin/institutionManager";
    }


    //User

//    //lista wszystkich userów
//    @RequestMapping("/userManager")
//    public String all(Model model){
//        model.addAttribute("users", userRepository.findAll());
//        return "/admin/userList";
//    }
//
//    @GetMapping("/userAdd")
//    public String addUser(Model model){
//        model.addAttribute("user", new User());
//        return "/admin/userForm";
//    }
//
//    @PostMapping("/userAdd")
//    public String userAdd(@ModelAttribute User user){
//        userRepository.save(user);
//        return "redirect:/admin/userList";
//    }
//
//    @GetMapping("/userEdit/{id}")
//    public String editUser(@PathVariable Long id, Model model){
//        model.addAttribute("user", userRepository.findById(id));
//        return "/admin/userEdit";
//    }
//
//    @PostMapping("/userUpdate")
//    public String userUpdate(@ModelAttribute User user){
//        userRepository.save(user);
//        return "redirect:/admin/userList";
//    }
//
//    @GetMapping("/deleteUser/{id}")
//    public String userDelete(@PathVariable Long id){
//        userRepository.deleteById(id);
//        return "redirect:/admin/userList";
//    }
//    //dodać dezaktywację i aktywację usera
//

}
