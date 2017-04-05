package org.service.impl;

import java.util.List;

import org.dao.CatalogDao;
import org.service.CatalogService;

public class CatalogServiceImpl implements CatalogService {
	CatalogDao catalogDao;
	public void setCatalogDao(CatalogDao catalogDao) {
		this.catalogDao = catalogDao;
	}
	@Override
	public List getAllCatalogs() {
		
		return catalogDao.getAllCatalogs();
	}

}
