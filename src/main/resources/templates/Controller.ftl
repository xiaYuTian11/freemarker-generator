package ${package_name};

import com.zenith.common.domain.vo.PageVO;
import com.zenith.core.result.R;
import ${api_package_name}.${table_name}Service;
import ${dto_package_name}.${table_name}DTO;
import ${dto_package_name}.${table_name}ListDTO;
import ${vo_package_name}.${table_name}VO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;
import java.util.Objects;

/**
* @author ${author}
* @date ${date}
*/
@RestController
@RequestMapping("/${lower_table_name}")
@Validated
public class ${table_name}Controller {

    @Autowired
    private ${table_name}Service ${lower_table_name}Service;

    /**
     * 新增
     */
    @PostMapping("/save")
    public R save(@Validated @RequestBody ${table_name}DTO dto) {
        String id = ${lower_table_name}Service.save(dto);
        return Objects.isNull(id) ? R.fail() : R.ok(id);
    }

    /**
     * 详情
     */
    @PostMapping("/find/{id}")
    public R find(@NotNull(message = "id 不能为空") @PathVariable String id) {
        ${table_name}VO vo = ${lower_table_name}Service.findById(id);
        return R.ok(vo);
    }

    /**
     * 修改
     */
    @PostMapping("/update")
    public R update(@Validated @RequestBody ${table_name}DTO dto) {
        boolean flag = ${lower_table_name}Service.update(dto);
        return flag ? R.ok() : R.fail();
    }

    /**
     * 删除
     */
    @PostMapping("/delete/{id}")
    public R delete(@NotNull(message = "id 不能为空") @PathVariable String id) {
        boolean flag = ${lower_table_name}Service.delete(id);
        return flag ? R.ok() : R.fail();
    }

    /**
     * 列表
     */
    @PostMapping("/list")
    public R list(@Validated @RequestBody ${table_name}ListDTO dto) {
        final PageVO<?> pageVO = ${lower_table_name}Service.list(dto);
        return R.ok(pageVO);
    }
}
