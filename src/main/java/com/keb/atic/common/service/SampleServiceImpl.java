package com.keb.atic.common.service;

import org.springframework.stereotype.Service;

@Service
public class SampleServiceImpl implements SampleService {

	@Override
	public Integer doAdd(String str, String str2) throws Exception {
		return Integer.parseInt(str) + Integer.parseInt(str2) ;
	}

}
