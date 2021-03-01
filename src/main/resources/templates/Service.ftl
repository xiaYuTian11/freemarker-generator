package ${package_name};

import com.zenith.common.domain.vo.PageVO;
import ${dto_package_name}.${table_name}DTO;
import ${dto_package_name}.${table_name}ListDTO;
import ${entity_package_name}.${table_name};
import ${vo_package_name}.${table_name}VO;
import com.zenith.mybatis.core.api.base.IService;

/**
* @author ${author}
* @date ${date}
*/
public interface ${table_name}Service extends IService<${table_name}> {
    /***
    * 新增
    */
    String save(${table_name}DTO dto);

    /**
    * 详情
    */
    ${table_name}VO findById(String id);

    /**
    * 修改
    */
    boolean update(${table_name}DTO dto);

    /**
    * 删除
    */
    boolean delete(String id);

    /**
    * 列表查询
    */
    PageVO<?> list(${table_name}ListDTO dto);
}
