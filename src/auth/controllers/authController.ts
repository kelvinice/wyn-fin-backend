import { Controller, Post, Body, UseGuards, Req, Res, HttpException, HttpStatus, Get } from '@nestjs/common';
import { AuthService } from '../services/auth.service';
import { RegisterDto } from '../dto/register.dto';
import { LoginDto } from '../dto/login.dto';
import { LocalAuthGuard } from '../guards/local-auth.guard';
import { JwtAuthGuard } from '../guards/jwt-auth.guard';
import { Request, Response } from 'express';
import rateLimit from 'express-rate-limit';
import { GetUser } from '../../common/decorators/get-user.decorator';
import { User } from '@prisma/client';

// Rate limiting for auth endpoints - 5 attempts per 15 minutes
const authLimiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 5,
  message: 'Too many authentication attempts, please try again later',
  standardHeaders: true,
  legacyHeaders: false,
});

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post('register')
  async register(@Body() registerDto: RegisterDto, @Res() response: Response) {
    // Apply rate limiting
    // authLimiter(response.req, response, () => {});
    
    try {
      const user = await this.authService.register(registerDto);
      return response.status(201).json(user);
    } catch (error) {
      throw new HttpException(
        error.message || 'Registration failed',
        error.status || HttpStatus.INTERNAL_SERVER_ERROR
      );
    }
  }

  @UseGuards(LocalAuthGuard) 
  @Post('login')
  async login(@Req() req: Request) {
    try {
      // This will now return { accessToken, user, expiresIn }
      return this.authService.login(req.user);
    } catch (error) {
      throw new HttpException(
        'Login failed',
        HttpStatus.UNAUTHORIZED
      );
    }
  }

  @UseGuards(JwtAuthGuard)
  @Get('me')
  getProfile(@GetUser() user: User) {
    // Remove the password field for security
    const { password, ...result } = user;
    return result;
  }
}