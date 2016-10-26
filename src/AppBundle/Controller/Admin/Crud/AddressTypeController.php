<?php

namespace AppBundle\Controller\Admin\Crud;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use AppBundle\Entity\AddressType;
use AppBundle\Form\AddressTypeType;

/**
 * AddressType controller.
 *
 * @Route("/admin/addresstype")
 */
class AddressTypeController extends Controller
{
    /**
     * Lists all AddressType entities.
     *
     * @Route("/", name="admin_addresstype_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $addressTypes = $em->getRepository('AppBundle:AddressType')->findAll();

        return $this->render('admin/crud/addresstype/index.html.twig', array(
            'addressTypes' => $addressTypes,
        ));
    }

    /**
     * Creates a new AddressType entity.
     *
     * @Route("/new", name="admin_addresstype_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $addressType = new AddressType();
        $form = $this->createForm('AppBundle\Form\AddressTypeType', $addressType);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($addressType);
            $em->flush();

            return $this->redirectToRoute('admin_addresstype_show', array('id' => $addressType->getId()));
        }

        return $this->render('admin/crud/addresstype/new.html.twig', array(
            'addressType' => $addressType,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a AddressType entity.
     *
     * @Route("/{id}", name="admin_addresstype_show")
     * @Method("GET")
     */
    public function showAction(AddressType $addressType)
    {
        $deleteForm = $this->createDeleteForm($addressType);

        return $this->render('admin/crud/addresstype/show.html.twig', array(
            'addressType' => $addressType,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing AddressType entity.
     *
     * @Route("/{id}/edit", name="admin_addresstype_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, AddressType $addressType)
    {
        $deleteForm = $this->createDeleteForm($addressType);
        $editForm = $this->createForm('AppBundle\Form\AddressTypeType', $addressType);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($addressType);
            $em->flush();

            return $this->redirectToRoute('admin_addresstype_edit', array('id' => $addressType->getId()));
        }

        return $this->render('admin/crud/addresstype/edit.html.twig', array(
            'addressType' => $addressType,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a AddressType entity.
     *
     * @Route("/{id}", name="admin_addresstype_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, AddressType $addressType)
    {
        $form = $this->createDeleteForm($addressType);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($addressType);
            $em->flush();
        }

        return $this->redirectToRoute('admin_addresstype_index');
    }

    /**
     * Creates a form to delete a AddressType entity.
     *
     * @param AddressType $addressType The AddressType entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(AddressType $addressType)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('admin_addresstype_delete', array('id' => $addressType->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
