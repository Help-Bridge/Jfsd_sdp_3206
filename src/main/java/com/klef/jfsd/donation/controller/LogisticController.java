package com.klef.jfsd.donation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.donation.model.Logistic;
import com.klef.jfsd.donation.service.LogisticService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class LogisticController
{
    @Autowired
    private LogisticService logisticService;

    @GetMapping("preglogistic")
    public ModelAndView reglogistic()
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("plogisticreg");
        return mv;
    }

    @GetMapping("logisticlogin")
    public ModelAndView logisticlogin()
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("logisticlogin");
        return mv;
    }

    @PostMapping("insertlogistic")
    public ModelAndView insertlogistic(HttpServletRequest request)
    {
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String location = request.getParameter("location");
        String email = request.getParameter("email");
        String password = request.getParameter("pwd");
        String contact = request.getParameter("contact");
        String status = "Registered";

        Logistic logistic = new Logistic();
        logistic.setName(name);
        logistic.setGender(gender);
        logistic.setDateofbirth(dob);
        logistic.setLocation(location);
        logistic.setEmail(email);
        logistic.setPassword(password);
        logistic.setContact(contact);
        logistic.setStatus(status);

        String msg = logisticService.logisticRegistration(logistic);

        ModelAndView mv = new ModelAndView("regsuccess");
        mv.addObject("message", msg);

        return mv;
    }

    @PostMapping("checklogisticlogin")
    public ModelAndView checklogisticlogin(HttpServletRequest request)
    {
        ModelAndView mv = new ModelAndView();

        String lemail = request.getParameter("lcemail");
        String lpwd = request.getParameter("lcpassword");
        Logistic logistic = logisticService.checklogisticlogin(lemail, lpwd);

        if (logistic != null  && ("Accepted").equalsIgnoreCase(logistic.getStatus()))
        {
            HttpSession session = request.getSession();
            session.setAttribute("logistic", logistic);

            mv.setViewName("logistichome");
        }
        else if(logistic != null  && ("Rejected").equalsIgnoreCase(logistic.getStatus()))
        {
        	mv.setViewName("logisticlogin");
        	mv.addObject("message", "Id Rejected");
        	
        }
        else if(logistic != null  && ("Registered").equalsIgnoreCase(logistic.getStatus()))
        {
        	mv.setViewName("logisticlogin");
        	mv.addObject("message", "Pending... Try after sometime.");
        }
        else
        {
            mv.setViewName("logisticlogin");
            mv.addObject("message", "Login Failed");
        }
        return mv;
    }

    @GetMapping("logisticcontactus")
    public ModelAndView logisticcontactus()
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("logisticcontactus");
        return mv;
    }

    @GetMapping("logisticprofile")
    public ModelAndView logisticprofile()
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("logisticprofile");
        return mv;
    }
    
    
    @GetMapping("logistichome")
    public ModelAndView logistichome()
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("logistichome");
        return mv;
    }
    
}
