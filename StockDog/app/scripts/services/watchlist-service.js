'use strict';

angular.module('stockDogApp')
  .service('WatchlistService', function WatchlistService() {
      // [1] Helper: Load watchlists from localStorage
      var loadModel = function () {
          var model = {
              watchlists: localStorage['StockDog.watchlists'] ?
              JSON.parse(localStorage['StockDog.watchlists']) : [],
              nextId: localStorage['StockDog.nextId'] ?
              parseInt(localStorage['StockDog.nextId']) : 0
          };
          return model;
      };

      // [2] Helper: Save watchlists to localStorage
      var saveModel = function () {
          localStorage['StockDog.watchlists'] =
          JSON.stringify(Model.watchlists);
          localStorage['StockDog.nextId'] = Model.nextId;
      };

      // [3] Helper: Use lodash to find a watchlist with given ID
      var findById = function (listId) {
          return _.find(Model.watchlists, function (watchlist) {
              return watchlist.id === parseInt(listId);
          });
      };

      // [4] Return all watchlists or find by given ID
      this.query = function (listId) {
          if (listId) {
              return findById(listId);
          } else {
              return Model.watchlists;
          }
      };

      // [5] Save a new watchlist to watchlists model
      this.save = function (watchlist) {
          watchlist.id = Model.nextId++;
          Model.watchlists.push(watchlist);
          saveModel();
      };
      // [6] Remove given watchlist from watchlists model
      this.remove = function (watchlist) {
          _.remove(Model.watchlists, function (list) {
              return list.id === watchlist.id;
          });
          saveModel();
      };

      // [7] Initialize Model for
      var Model = loadModel();
  });
