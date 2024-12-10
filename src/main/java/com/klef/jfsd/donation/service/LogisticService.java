package com.klef.jfsd.donation.service;

import com.klef.jfsd.donation.model.Logistic;

public interface LogisticService
{
    public String logisticRegistration(Logistic l);
    public Logistic checklogisticlogin(String lemail, String lpwd);
}
