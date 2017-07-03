﻿using NHibernate;
using NHibernate.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Swinkaran.Nhbnt.Web.Models
{
    public class Repository<TEntity> : IReadWriteRepository<TEntity>
    where TEntity : class
    {
        private readonly ISession _session;

        public Repository(ISession session)
        {
            _session = session;
        }

        #region IWriteRepository

        public bool Add(TEntity entity)
        {
            _session.Save(entity);
            _session.Flush();
            return true;
        }

        public bool Add(System.Collections.Generic.IEnumerable<TEntity> entities)
        {
            foreach (TEntity entity in entities)
            {
                _session.Save(entity);
                _session.Flush();
            }
            return true;
        }

        public bool Update(TEntity entity)
        {
            // _session.Merge(entity);
            _session.Clear();
            _session.Update(entity);
            _session.Flush();
            return true;
        }

        public bool Update(System.Collections.Generic.IEnumerable<TEntity> entities)
        {
            foreach (TEntity entity in entities)
            {
                _session.Clear();
                _session.Update(entity);
                _session.Flush();
            }
            return true;
        }

        public bool Delete(TEntity entity)
        {
            // _session.Evict(entity);
            //TEntity findAAgain = _session.Merge(entity);
            _session.Clear();
            _session.Delete(entity);
            _session.Flush();
            return true;
        }

        public bool Delete(System.Collections.Generic.IEnumerable<TEntity> entities)
        {
            foreach (TEntity entity in entities)
            {
                Object findAAgain = _session.Merge(entity);
                _session.Delete(findAAgain);
            }
            return true;
        }

        #endregion

        #region IReadRepository

        public System.Linq.IQueryable<TEntity> All()
        {
            return _session.Query<TEntity>();
        }

        public TEntity FindBy(System.Linq.Expressions.Expression<System.Func<TEntity, bool>> expression)
        {
            return FilterBy(expression).SingleOrDefault();
        }

        public TEntity FindBy(object id)
        {
            return _session.Get<TEntity>(id);
        }

        public System.Linq.IQueryable<TEntity> FilterBy(System.Linq.Expressions.Expression<System.Func<TEntity, bool>> expression)
        {
            return All().Where(expression).AsQueryable();
        }

        #endregion
    }
}