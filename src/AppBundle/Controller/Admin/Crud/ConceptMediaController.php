<?php

namespace AppBundle\Controller\Admin\Crud;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use AppBundle\Entity\ConceptMedia;
use AppBundle\Form\ConceptMediasType;

/**
 * ConceptMedia controller.
 *
 * @Route("/admin/conceptmedia")
 */
class ConceptMediaController extends Controller
{
    /**
     * Lists all ConceptMedia entities.
     *
     * @Route("/", name="admin_conceptmedia_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $conceptMedia = $em->getRepository('AppBundle:ConceptMedia')->findAll();

        return $this->render('admin/crud/conceptmedia/index.html.twig', array(
            'conceptMedia' => $conceptMedia,
        ));
    }

    /**
     * Creates a new ConceptMedia entity.
     *
     * @Route("/new", name="admin_conceptmedia_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $conceptMedia = new ConceptMedia();
        $form = $this->createForm('AppBundle\Form\ConceptMediasType', $conceptMedia);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($conceptMedia);
            $em->flush();

            return $this->redirectToRoute('admin_conceptmedia_show', array('id' => $conceptMedia->getId()));
        }

        return $this->render('admin/crud/conceptmedia/new.html.twig', array(
            'conceptMedia' => $conceptMedia,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a ConceptMedia entity.
     *
     * @Route("/{id}", name="admin_conceptmedia_show")
     * @Method("GET")
     */
    public function showAction(ConceptMedia $conceptMedia)
    {
        $deleteForm = $this->createDeleteForm($conceptMedia);

        return $this->render('admin/crud/conceptmedia/show.html.twig', array(
            'conceptMedia' => $conceptMedia,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing ConceptMedia entity.
     *
     * @Route("/{id}/edit", name="admin_conceptmedia_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, ConceptMedia $conceptMedia)
    {
        $deleteForm = $this->createDeleteForm($conceptMedia);
        $editForm = $this->createForm('AppBundle\Form\ConceptMediasType', $conceptMedia);
        $editForm->handleRequest($request);

        $conceptMedia->setUpdatedAt(new \DateTime());

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($conceptMedia);
            $em->flush();

            return $this->redirectToRoute('admin_conceptmedia_edit', array('id' => $conceptMedia->getId()));
        }

        return $this->render('admin/crud/conceptmedia/edit.html.twig', array(
            'conceptMedia' => $conceptMedia,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a ConceptMedia entity.
     *
     * @Route("/{id}", name="admin_conceptmedia_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, ConceptMedia $conceptMedia)
    {
        $form = $this->createDeleteForm($conceptMedia);
        $form->handleRequest($request);

        $conceptMedia->setDeletedAt(new \DateTime());

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($conceptMedia);
            $em->flush();
        }

        return $this->redirectToRoute('admin_conceptmedia_index');
    }

    /**
     * Creates a form to delete a ConceptMedia entity.
     *
     * @param ConceptMedia $conceptMedia The ConceptMedia entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(ConceptMedia $conceptMedia)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('admin_conceptmedia_delete', array('id' => $conceptMedia->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
