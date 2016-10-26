<?php

namespace AppBundle\Controller\Admin\Crud;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use AppBundle\Entity\ClientType;
use AppBundle\Form\ClientTypeType;

/**
 * ClientType controller.
 *
 * @Route("/admin/clienttype")
 */
class ClientTypeController extends Controller
{
    /**
     * Lists all ClientType entities.
     *
     * @Route("/", name="admin_clienttype_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $clientTypes = $em->getRepository('AppBundle:ClientType')->findAll();

        return $this->render('admin/crud/clienttype/index.html.twig', array(
            'clientTypes' => $clientTypes,
        ));
    }

    /**
     * Creates a new ClientType entity.
     *
     * @Route("/new", name="admin_clienttype_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $clientType = new ClientType();
        $form = $this->createForm('AppBundle\Form\ClientTypeType', $clientType);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($clientType);
            $em->flush();

            return $this->redirectToRoute('admin_clienttype_show', array('id' => $clientType->getId()));
        }

        return $this->render('admin/crud/clienttype/new.html.twig', array(
            'clientType' => $clientType,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a ClientType entity.
     *
     * @Route("/{id}", name="admin_clienttype_show")
     * @Method("GET")
     */
    public function showAction(ClientType $clientType)
    {
        $deleteForm = $this->createDeleteForm($clientType);

        return $this->render('admin/crud/clienttype/show.html.twig', array(
            'clientType' => $clientType,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing ClientType entity.
     *
     * @Route("/{id}/edit", name="admin_clienttype_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, ClientType $clientType)
    {
        $deleteForm = $this->createDeleteForm($clientType);
        $editForm = $this->createForm('AppBundle\Form\ClientTypeType', $clientType);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($clientType);
            $em->flush();

            return $this->redirectToRoute('admin_clienttype_edit', array('id' => $clientType->getId()));
        }

        return $this->render('admin/crud/clienttype/edit.html.twig', array(
            'clientType' => $clientType,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a ClientType entity.
     *
     * @Route("/{id}", name="admin_clienttype_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, ClientType $clientType)
    {
        $form = $this->createDeleteForm($clientType);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($clientType);
            $em->flush();
        }

        return $this->redirectToRoute('admin_clienttype_index');
    }

    /**
     * Creates a form to delete a ClientType entity.
     *
     * @param ClientType $clientType The ClientType entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(ClientType $clientType)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('admin_clienttype_delete', array('id' => $clientType->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
