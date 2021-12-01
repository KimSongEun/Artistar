package com.mycompany.artistar.common.service;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.StopWatch;
import org.springframework.web.servlet.ModelAndView;

@Service
@Aspect
public class AroundLog {
	@Pointcut("execution(public * com.mycompany.artistar..*Impl.*(..))")
	public void commonServicePointcut() {
	}
	@Pointcut("execution(public * com.mycompany.artistar..*Controller.*(..))")
	public void commonControllerPointcut() { 
	}
	@Pointcut("execution(public * com.mycompany.artistar..*Dao.*(..))")
	public void commonDaoPointcut() {
	}
	
	//TODO:나중에 필요한 걸로 바꾸기!
	@Around("commonServicePointcut()")
	public Object aroundServiceLog(ProceedingJoinPoint pjp) throws Throwable {
		System.out.println("[Srv class:" + pjp.getThis() + ", method:" + pjp.getSignature().getName() + "]");
		Object[] args = pjp.getArgs();
		for(int i=0;i<args.length; i++) {
			System.out.print("args["+i+"]: " + args[i] + ",\n");
		}
		
		StopWatch sw = new StopWatch();
		sw.start();
		
		Object ro = pjp.proceed();
		sw.stop();
		
		if(ro!=null) {
			System.out.println("return val: " + ro.toString());
		}
		System.out.println("[Srv: " + sw.getTotalTimeMillis() + "ms]");
		return ro;
	}
	@Around("commonControllerPointcut()")
	public Object aroundControllerLog(ProceedingJoinPoint pjp) throws Throwable {
		System.out.println("[Ctrl class:" + pjp.getThis() + ", method:" + pjp.getSignature().getName() + "]");
		Object[] args = pjp.getArgs();
		for(int i=0;i<args.length; i++) {
			if(!(args[i] instanceof ModelAndView))
				System.out.print("args["+i+"]: " + args[i] + ",\n");
		}
		
		StopWatch sw = new StopWatch();
		sw.start();
		
		Object ro = pjp.proceed();
		sw.stop();
		
		if(ro!=null) {
			System.out.println("return val: " + ro.toString());
		}
		System.out.println("[Ctrl: " + sw.getTotalTimeMillis() + "ms]");
		return ro;
	}
	@Around("commonDaoPointcut()")
	public Object aroundDaoLog(ProceedingJoinPoint pjp) throws Throwable {
		System.out.println("[DAO class:" + pjp.getThis() + ", method:" + pjp.getSignature().getName() + "]");
		Object[] args = pjp.getArgs();
		for(int i=0;i<args.length; i++) {
			System.out.print("args["+i+"]: " + args[i] + ",\n");
		}
		
		StopWatch sw = new StopWatch();
		sw.start();
		
		Object ro = pjp.proceed();
		sw.stop();
		
		if(ro!=null) {
			System.out.println("return val: " + ro.toString());
		}
		System.out.println("[DAO: " + sw.getTotalTimeMillis() + "ms]");
		return ro;
	}
}
