package com.keb.atic.common.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.keb.atic.common.mapper.Sample1Mapper;
import com.keb.atic.common.mapper.Sample2Mapper;

import lombok.extern.log4j.Log4j;
@Transactional
@Service
@Log4j
public class SampleTxServiceImpl implements SampleTxService {
	@Inject
	Sample1Mapper mapper1;
	@Inject
	Sample2Mapper mapper2;
	public void addData(String value) {
		log.info("mapper1........");
		mapper1.insertCol1(value);
		log.info("mapper1........");
		mapper2.insertCol2(value);
		log.info("end..........");
	}


}
