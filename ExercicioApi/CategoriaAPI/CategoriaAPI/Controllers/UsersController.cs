﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using CategoriaAPI.Data;
using CategoriaAPI.Entities;
using CategoriaAPI.Entities.Dtos;
using Microsoft.IdentityModel.Tokens;
using CategoriaAPI.Config;

namespace CategoriaAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly CategoriaContext _context;

        public UsersController(CategoriaContext context)
        {
            _context = context;
        }

        // GET: api/Users
        [HttpGet]
        public async Task<ActionResult<IEnumerable<User>>> GetUsers()
        {
            return await _context.Users.ToListAsync();
        }

        // GET: api/Users/5
        [HttpGet("{id}")]
        public async Task<ActionResult<User>> GetUser(int id)
        {
            var user = await _context.Users.FindAsync(id);

            if (user == null)
            {
                return NotFound();
            }

            return user;
        }

        [HttpPost("login")]
        public async Task<ActionResult<dynamic>> UserLogin(UserDto user)
        {
            var token = "";
            var users = await _context.Users.ToListAsync();

            var userLogado = (from u in users where u.Username == user.Username & u.Password == user.Password select u).ToList();

            if (userLogado.IsNullOrEmpty())
            {
                return NotFound();
            }
            token = TokenService.GenerateToken(userLogado[0]);

            return new { token = token };
        }

        // POST: api/Users
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<User>> PostUser(User user)
        {
            _context.Users.Add(user);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetUser", new { id = user.Id }, user);
        }


        private bool UserExists(int id)
        {
            return _context.Users.Any(e => e.Id == id);
        }
    }
}
