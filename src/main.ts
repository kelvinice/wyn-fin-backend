import { NestFactory } from '@nestjs/core';
import { ValidationPipe } from '@nestjs/common';
import { AppModule } from './app.module';
import { ConfigService } from '@nestjs/config';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  const configService = app.get(ConfigService);
  
  // Set global prefix '/api' for all routes
  app.setGlobalPrefix('api');
  
  // Get allowed origins from environment or use default
  const allowedOrigins = configService.get('ALLOWED_ORIGINS') || 'http://localhost:5173';
  const origins = allowedOrigins.split(',').map(origin => origin.trim());
  
  // Configure CORS with proper settings
  app.enableCors({
    origin: origins,
    credentials: true,
    methods: ['GET', 'HEAD', 'PUT', 'PATCH', 'POST', 'DELETE', 'OPTIONS'],
    allowedHeaders: ['Content-Type', 'Authorization', 'Accept'],
    preflightContinue: false,
    optionsSuccessStatus: 204
  });
  
  // Enable validation globally
  app.useGlobalPipes(new ValidationPipe({
    whitelist: true,
    transform: true,
    forbidNonWhitelisted: true,
  }));
  
  await app.listen(process.env.PORT ?? 3000);
}
bootstrap();