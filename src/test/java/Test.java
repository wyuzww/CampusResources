import com.ethan.entity.*;
import com.ethan.service.CategoryService;
import com.ethan.service.PostService;
import com.ethan.service.ResourceService;
import com.ethan.service.UserService;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class Test {
    @Resource(name="userService")
    private UserService userService;

    @Resource(name="resourceService")
    private ResourceService resourceService;

    @Resource(name="postService")
    private PostService postService;

    @Resource(name="categoryService")
    private CategoryService categoryService;

    @org.junit.Test
    public void demo1() {
        User user = new User();
        user.setUser_id("admin");
        user.setUser_password("admin");

        User cur_User = userService.login(user);
        if (cur_User==null) {
            System.out.println("登录失败！");
        } else {
            System.out.println(cur_User);
        }
    }

    @org.junit.Test
    public void demo2() {


        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(com.ethan.entity.Resource.class);
        List<com.ethan.entity.Resource> list = resourceService.findAllResource(detachedCriteria,null).getList();
        if (list==null) {
            System.out.println("登录失败！");
        } else {
            System.out.println(list);
        }
    }

    @org.junit.Test
    public void demo3() {
        Query query = new Query();
        PageBean pageBean = new PageBean();
        query.setQuery_name("");
        query.setQuery_type("学生");
        pageBean.setPageSize(8);
        pageBean.setCurPage(1);

//        PageBean<Post> postPageBean = postService.findAllByHQL(query,pageBean);

        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Post.class);

        detachedCriteria.add(Restrictions.like("post_title",query.getQuery_name()==null?"":query.getQuery_name(), MatchMode.ANYWHERE)).addOrder(Order.desc("post_id"));

//        detachedCriteria.add(Restrictions.like("post_user.user_level","学生"));

        detachedCriteria.createAlias("post_user", "p_user");
        detachedCriteria.add(Restrictions.like("p_user.user_level", "学生", MatchMode.EXACT));
        PageBean<Post> postPageBean = postService.findAllPost(detachedCriteria,pageBean);


        System.out.println(postPageBean.getList());
    }

    @org.junit.Test
    public void demo4() {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Category.class);

        PageBean pageBean = new PageBean();

        PageBean<Category> categoryPageBean = categoryService.findAllCategory(detachedCriteria, pageBean, 0);

        System.out.println(categoryPageBean.getList());

    }

    @org.junit.Test
    public void demo5() {
        User user = new User();
        user.setUser_id("student1");

        Student student = new Student();
        student.setStudent_sex("女");

        user.setUser_student(student);
        userService.updateUser(user);
        System.out.println(user);
    }

    @org.junit.Test
    public void demo6() {
        User user = new User();
        String user_password_old = "12345";
        String user_password_new = "123456";
        user.setUser_id("student1");
        user.setUser_password(user_password_old);

        Boolean result = userService.updatePwd(user, user_password_new);

        System.out.println(result);
    }


}
