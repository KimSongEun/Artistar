package com.mycompany.artistar.common.service;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;
import org.springframework.util.StopWatch;

@Service
@Aspect
public class AroundLog {
	@Pointcut("execution(public * com.mycompany.artistar..*Service.*(..))")
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
		System.out.println("aroundLog 메소드!!!!!" + pjp.getThis() + "target name : " + pjp.getSignature().getName());
		
		StopWatch sw = new StopWatch();
		sw.start();
		
		Object ro = pjp.proceed();
		sw.stop();
		System.out.println("메소드 수행시간 : " + sw.getTotalTimeMillis() + "ms");
		if(ro!=null) {
			System.out.println("target return : " + ro.toString());
		}
		return ro;
	}
	@Around("commonControllerPointcut()")
	public Object aroundControllerLog(ProceedingJoinPoint pjp) throws Throwable {
		System.out.println("aroundLog 메소드!!!!!" + pjp.getThis() + "target name : " + pjp.getSignature().getName());
		
		StopWatch sw = new StopWatch();
		sw.start();
		
		Object ro = pjp.proceed();
		sw.stop();
		System.out.println("메소드 수행시간 : " + sw.getTotalTimeMillis() + "ms");
		if(ro!=null) {
			System.out.println("target return : " + ro.toString());
		}
		return ro;
	}
	@Around("commonDaoPointcut()")
	public Object aroundDaoLog(ProceedingJoinPoint pjp) throws Throwable {
		System.out.println("aroundLog 메소드!!! "+ pjp.getThis() + " target name: "+ pjp.getSignature().getName());
		
		StopWatch sw = new StopWatch();
		sw.start();
		
		Object ro = pjp.proceed();   // 타겟 메소드 실행 - 타겟 메소드에 throws가 걸려있을 수 있으므로 이메소드에서도 throws Throwable  작성해주어야함. try/catch 하지말기!
		
		sw.stop();
		System.out.println("메소드 수행시간: "+ sw.getTotalTimeMillis() +"ms");
		if(ro != null) {
			System.out.println("target return: "+ ro.toString());
		}
		return ro;
	}
}
