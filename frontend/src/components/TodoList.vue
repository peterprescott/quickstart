<template>
	<div>
		<BaseInputText 
			v-model="newTodoText"
			placeholder="New todo"
			@keydown.enter="addTodo"
		/>
		<ul v-if="todos.length">
			<TodoListItem
				v-for="todo in todos"
				:key="todo.id"
				:todo="todo"
				@remove="removeTodo"
			/>
		</ul>
		<p v-else>
			Nothing left in the list. Add a new todo in the input above.
		</p>
	</div>
</template>

<script>
import axios from 'axios'

import BaseInputText from './BaseInputText.vue'
import TodoListItem from './TodoListItem.vue'

let nextTodoId = 1

export default {
	components: {
		BaseInputText, TodoListItem
	},

	props: {
		apiURL: '',
	},

  data () {
    return {
			newTodoText: '',
      todos: []
    }
  },

	methods: {
		getTodos() {
			/* use axios to get Todos from API */
			console.log(this.apiURL)
			axios.get(this.apiURL + '/todos')
				.then(r => {
					let myTodos = r.data;
				  for (let i = 0; i < myTodos.length; i++){
							this.todos.push({
								'id': myTodos[i].id,
								'task': myTodos[i].task
							})
						};
			  	}
				)
				.catch(e => console.log(e))
		},
		addTodo () {
			const trimmedText = this.newTodoText.trim()
			if (trimmedText) {
				axios.post(this.apiURL + '/todos',
					{'task': trimmedText})
				 .then(r => {
				this.todos.push({
					'id': r.data.id,
					'task': r.data.task
				});
				this.newTodoText = ''
				  }
				)
			}
		},
		removeTodo (idToRemove) {
			axios.delete(this.apiURL + '/todos/' + idToRemove)
				.then(r => {
			this.todos = this.todos.filter(todo => {
				return todo.id !== idToRemove
		    	})
				})
		},
	},

	mounted() {
		this.getTodos()
	},
}
</script>
