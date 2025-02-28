import { NestFactory } from '@nestjs/core';
import { ValidationPipe } from '@nestjs/common';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  // Set global prefix '/api' for all routes
  app.setGlobalPrefix('api');
  
  // Enable validation globally
  app.useGlobalPipes(new ValidationPipe({
    whitelist: true,
    transform: true,
    forbidNonWhitelisted: true,
  }));
  
  // Enable CORS if needed
  app.enableCors();
  
  await app.listen(process.env.PORT ?? 3000);
}
bootstrap();