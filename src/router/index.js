import Vue from 'vue';
import Router from 'vue-router';
import Index from '@/components/Index';
import Login from '@/components/Login';
import Add from '@/components/Add';
import Edit from '@/components/Edit';
import Reg from '@/components/Reg';
Vue.use(Router);

var router=new Router({
  routes: [
    {
      path: '/',
      component: Index	
    },
    {
    	path:'/login',
    	component:Login
    },
    {
    	path:'/add',
    	component:Add
    },
    {
    	path:'/edit/:id',
    	component:Edit
    },
    {
    	path:'/reg',
    	component:Reg
    }
  ]
})
router.beforeEach(function(to,from,next){
	if(sessionStorage.login=="yes"){
		next();
	}else{
		if(to.path=="/login"||to.path=="/reg"){
			next();
		}else{
			next('/login');
		}
	}
});
export default router;