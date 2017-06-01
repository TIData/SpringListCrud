package controller;

import domain.Contact;
import java.util.Locale;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.ContactService;
import utility.Message;


@RequestMapping("/contacts")
@Controller
public class ContactController {

    @Autowired
    private MessageSource messageSource;
    @Autowired
    private ContactService contactService;

 //TODO: requestMapping: value + return   
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String listCustomer2(Model model) {
        model.addAttribute("contactList", contactService.findAll());
        return "contacts/list";
    }

    //TODO: requestMapping: value, argument en return
    @RequestMapping(value = "/{id}" , method = RequestMethod.GET)
    public String show(@PathVariable("id") Long id , Model model) {
        Contact contact = contactService.findById(id);
        model.addAttribute("contact", contact);
        return "contacts/show";
    }

 //TODO: requestMapping: value, argument en return 
   @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") Long id, Model model) {


        model.addAttribute("contact", contactService.findById(id));
        return "contacts/edit";
    }

    //TODO: value, argumentEN, foutboodschap, 2x return
     
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public String update(@PathVariable("id") Long id,Contact contact, BindingResult bindingResult, Model model,Locale locale) {

        if (bindingResult.hasErrors()) {
        //FOUTBOODSCHAP "contact_save_fail"
            model.addAttribute("message", new Message("error",messageSource.getMessage("contact_save_fail", new Object[]{}, locale)));

            return "contacts/edit";
        }

        contact.setId(id);
        contactService.save(contact);

        model.addAttribute("contactList", contactService.findAll());
        return "contacts/list";

    }
}
