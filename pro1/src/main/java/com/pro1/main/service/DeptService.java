package com.pro1.main.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.pro1.main.dao.CommonDeptDAO;
import com.pro1.main.vo.DeptVO;

@Service
@Transactional
public class DeptService {

    @Autowired
    private CommonDeptDAO deptDAO;

    public List<DeptVO> selectDeptList() {
        List<DeptVO> deptList = null;
        try {
            deptList = deptDAO.selectDeptList();
        } catch (Exception e) {
            // TODO: handle exception
        }
        return deptList;
    }

}
