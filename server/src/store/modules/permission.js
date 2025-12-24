import { asyncRoutes, constantRoutes } from '@/router'

const state = {
  routes: constantRoutes.concat(asyncRoutes),
  addRoutes: asyncRoutes
}

const mutations = {
  SET_ROUTES: (state, routes) => {
    state.addRoutes = routes
    state.routes = constantRoutes.concat(routes)
  }
}

const actions = {
  generateRoutes({ commit }) {
    // No permission check needed, return all routes
    return new Promise(resolve => {
      const accessedRoutes = asyncRoutes || []
      commit('SET_ROUTES', accessedRoutes)
      resolve(accessedRoutes)
    })
  }
}

export default {
  namespaced: true,
  state,
  mutations,
  actions
}
