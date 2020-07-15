package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.entity.Category;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;

import javax.validation.Valid;
import java.util.Collection;
import java.util.List;


@Controller
public class DonationController {

    private final DonationRepository donationRepository;
    private final CategoryRepository categoryRepository;
    private final InstitutionRepository institutionRepository;


    public DonationController(DonationRepository donationRepository, CategoryRepository categoryRepository, InstitutionRepository institutionRepository) {
        this.donationRepository = donationRepository;
        this.categoryRepository = categoryRepository;
        this.institutionRepository = institutionRepository;
    }


    //obsługa adresu formularza
    @GetMapping("/form")
    public String getDonation(Model model) {
        model.addAttribute("donation", new Donation());
//        model.addAttribute("institution", new Institution());
//        model.addAttribute("donation", new Donation());
        return "form/form";
    }

    //po dodaniu formularza przeniesię na listę dotacji(domyślanie tylko dla tego użytkownika)
    @PostMapping("form-confirmation")
    public String allDonations(@Valid @ModelAttribute Donation donation, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "form/form";
        }
        donationRepository.save(donation);
        return "form-confirmation";
    }

    //Dodanie typów kategorii do formularza
    @ModelAttribute("categories")
    public Collection<Category> categories(){
        return categoryRepository.findAll();
    }

    //Dodanie instytucji do formularza
    @ModelAttribute("institutions")
    public List<Institution> institutions(){
        return institutionRepository.findAll();
    }
}
