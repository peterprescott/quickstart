<template>
	<div>
		<h1>My Todo App!</h1>
		<TodoList apiURL='http://localhost:5000' />
	</div>
</template>

<script>
import TodoList from '@/components/TodoList.vue'

export default {
	components: {
		TodoList
	},

	data () {
		/* apiURL: '' */

	},

	methods: {
		setAPI() {
			/* find current URL */
			console.log(window.location.pathname)
			/* this.apiURL = 'http://localhost:5000' */

		}, 
	},

	mounted() {
		/* this.setAPI() */
	},

}
</script>
