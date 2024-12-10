package com.klef.jfsd.donation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.donation.model.Logistic;
import com.klef.jfsd.donation.repository.LogisticRepository;

@Service
public class LogisticServiceImpl implements LogisticService
{
    @Autowired
    private LogisticRepository logisticRepository;

    @Override
    public String logisticRegistration(Logistic l)
    {
        logisticRepository.save(l);
        return "Logistic Registered Successfully";
    }

    @Override
    public Logistic checklogisticlogin(String lemail, String lpwd)
    {
        return logisticRepository.checklogisticLogin(lemail, lpwd);
    }
}
