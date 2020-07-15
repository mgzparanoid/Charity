package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.fixture.InitDataFixture;
import pl.coderslab.charity.repository.UserRepository;
import pl.coderslab.charity.service.UserService;

import javax.validation.Valid;

@Controller
public class UserController {

    private final UserService userService;
    private final InitDataFixture initDataFixture;
    private final UserRepository userRepository;

    public UserController(UserService userService, InitDataFixture initDataFixture, UserRepository userRepository) {
        this.userService = userService;
        this.initDataFixture = initDataFixture;
        this.userRepository = userRepository;
    }

    //tutaj tworzę admina do logowania
    @GetMapping("/create-user")
    @ResponseBody
    public String createUser() {
//        User user = new User();
//        user.setUsername("admin");
//        user.setPassword("admin");
//        userService.saveUser(user);
        this.initDataFixture.initRoles();
        this.initDataFixture.initUsers();
        return "Zainicjalizowano użytkowników";
    }


    //tworzenie nowego użytkownika

    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("user", new User());
        return "/user/add";
    }

    //Gdy użytkownik zostanie dodany ma przenosić do listy
    @PostMapping("/add")
    public String add(@Valid @ModelAttribute User user, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "/user/add";
        }
        userService.saveUser(user);
        return "redirect:/add";
    }

    //Tutaj przez Model
//    @RequestMapping("/register")
//    public String registration(Model model){
//        model.addAttribute("registerUser", new registerUser());
//        return "user/registerUser";
//    }

    //Edycja użytkownika

    @GetMapping("/edit/{id}")
    public String get(Model model, @PathVariable long id) {
        model.addAttribute("user", userRepository.findById(id));
        return "/admin/userEdit";
    }


    //Usuwanie użytkownika
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable long id) {
        userRepository.delete(userRepository.findById(id).orElse(null));
        return "redirect:/admin/userList";

    }
}
