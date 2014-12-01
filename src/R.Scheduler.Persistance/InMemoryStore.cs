﻿using System;
using System.Globalization;
using System.Runtime.Caching;
using R.Scheduler.Interfaces;

namespace R.Scheduler.Persistance
{
    /// <summary>
    /// InMemory implementation of IPersistanceStore
    /// </summary>
    public class InMemoryStore : IPersistanceStore
    {
        private static readonly ObjectCache Cache = MemoryCache.Default;
        private CacheItemPolicy _policy;

        public InMemoryStore()
        {
            _policy = new CacheItemPolicy { AbsoluteExpiration = DateTimeOffset.Now.AddHours(10.00) };
        }

        public void InsertAuditLog(AuditLog log)
        {
            _policy = new CacheItemPolicy { AbsoluteExpiration = DateTimeOffset.Now.AddHours(10.00) };

            if (log.TimeStamp == DateTime.MinValue)
            {
                log.TimeStamp = DateTime.UtcNow;
            }

            Cache.Set(log.TimeStamp.ToString(CultureInfo.InvariantCulture), log, _policy);
        }
    }
}
