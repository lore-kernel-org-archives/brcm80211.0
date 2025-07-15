Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E6D2ECD3C
	for <brcm80211@lists.linux.dev>; Tue, 15 Jul 2025 13:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752587165; cv=none; b=BPrlkT21ap5BbFoOwWqzqa+V4u4J++VIeoafI5LVC06I/ISF5V/kF5BsRNhBnwopnz9cXACPyx1X1GneAcHZpw9PlZsuAGiMsVbKnIwI6GkdeEpwfwSjw3dkG7fG9xm8f21NMsdb+1ueCqI4Zqmbxtj7mw8DRd3NjOFENo6gX7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752587165; c=relaxed/simple;
	bh=HjU6PxyUlCUhs2dvYf0iMA7Zry8aPzm7Aen+lVRuL90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a2dxxZQwO1P6DabMcuJhbeOSzLXh+tb/H6CkazsZgYENpVxFOwBI9EtQfP75Fo1sagcqbko/NXz/PgWykHQbj7FqEQWWi0icxGZPxSiUTe+tbqNh9iH8t2GmCARi2RWIERfP2b4IACGLHCzSk5NC4LcWk1rFdi8h8JaDvm0uEAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=S1ENMm7f; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="S1ENMm7f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1752587135;
	bh=ltFUUSzAPz2OoVfH54nkwDpFnO/axW/szGNu9HIiAOI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=S1ENMm7fYMw+wC3Nc2T3W/1mnOrrRxwGSj+HE9H3+L091aDpIgD6Awpfjaz9oABYV
	 ctOVZ/zt5hFQcVniHRXwpmmjkuoS0JpQZz87BbfHHONx220+fIhL/4OmFSeOxFyeKM
	 u7o3HWlJC3p334oMD1WZaIXnaDSJIQGAOU9Q5Zo4=
X-QQ-mid: zesmtpip2t1752587121taaa03ec6
X-QQ-Originating-IP: IIvVAyKvuXb4Hz7pVF2rGJuCkoWUtC78LZlVFBjDx2g=
Received: from avenger-e500 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 15 Jul 2025 21:45:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8982638937609059235
EX-QQ-RecipientCnt: 63
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: airlied@gmail.com,
	akpm@linux-foundation.org,
	alison.schofield@intel.com,
	andrew+netdev@lunn.ch,
	andriy.shevchenko@linux.intel.com,
	arend.vanspriel@broadcom.com,
	bp@alien8.de,
	brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev,
	colin.i.king@gmail.com,
	cvam0000@gmail.com,
	dan.j.williams@intel.com,
	dave.hansen@linux.intel.com,
	dave.jiang@intel.com,
	dave@stgolabs.net,
	davem@davemloft.net,
	dri-devel@lists.freedesktop.org,
	edumazet@google.com,
	gregkh@linuxfoundation.org,
	guanwentao@uniontech.com,
	hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com,
	intel-xe@lists.freedesktop.org,
	ira.weiny@intel.com,
	j@jannau.net,
	jeff.johnson@oss.qualcomm.com,
	jgross@suse.com,
	jirislaby@kernel.org,
	johannes.berg@intel.com,
	jonathan.cameron@huawei.com,
	kuba@kernel.org,
	kvalo@kernel.org,
	kvm@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux@treblig.org,
	lucas.demarchi@intel.com,
	marcin.s.wojtas@gmail.com,
	ming.li@zohomail.com,
	mingo@kernel.org,
	mingo@redhat.com,
	netdev@vger.kernel.org,
	niecheng1@uniontech.com,
	oleksandr_tyshchenko@epam.com,
	pabeni@redhat.com,
	pbonzini@redhat.com,
	quic_ramess@quicinc.com,
	ragazenta@gmail.com,
	rodrigo.vivi@intel.com,
	seanjc@google.com,
	shenlichuan@vivo.com,
	simona@ffwll.ch,
	sstabellini@kernel.org,
	tglx@linutronix.de,
	thomas.hellstrom@linux.intel.com,
	vishal.l.verma@intel.com,
	x86@kernel.org,
	xen-devel@lists.xenproject.org,
	yujiaoliang@vivo.com,
	zhanjun@uniontech.com
Subject: [PATCH v2 7/8] xen/xenbus: Fix typo "notifer"
Date: Tue, 15 Jul 2025 21:44:06 +0800
Message-ID: <906F22CD3C183048+20250715134407.540483-7-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
References: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: N/2JuoeGxbayhPHFCOmm5knYdufO0wCvl67pOQ3z1q+3LsO+nWTEzKpN
	iMIC7SutcsbyBSAoeroMDwOSLv8mdyb756+NAq8qMJ6lx7ymPfPW1gWynHyjHQiV7ZWJ/cL
	a6b0RSvVXzhXMeN+sEYQUU/DB41c2ya6dOJNTQ186nan7KQT1zR7urZfvIY2eULaec6z8lr
	DELriyT3kIkinX8DWEbM3PcU5z0mfqtBG05zhJDZacFECuhzB40iUTuBk/fP6k/bPPEyIW1
	JWwCHZjIXUNDnJoCdofpoxJ8SYs3oiTOOeTpKOZGVslZ+8E6RrBgaW4kyBZlPuvJaVbeuD5
	w9S3rU+2axUVmsnK72fw4pmN/aft4iD7ED+PlLrUBdPqc+YBnxTSv2gB7nUnzPnVFEdWkA5
	sqoM4JYMJfiniNT0KkHGlj1IguHh0JOt/ZsuPNYDCQMfRI1z5qHnXc/ClFqHh5Hinz0bNeN
	oksCdyvSx8/wWUGnukLUOXvU+hs+PBiVelLCK7WJvhAu2HZxj9gUM639+ylfZPvHghxZBKp
	fcm4yLgMBAIO/fTB3uafGMTRVSMjzyqesB244xjoSHQkP1yoLdAkXhNyCP5I4MUFK4DJwvR
	8c+MIfBFQO7HEjBXFpXCAirXk76Ih0prYesYClI0c9pK4F35kPdvgnKk3Do1pCnJwgfgJVw
	w0q5b5EDDFbmQwUuh4qf9WJnhN6RR15kd6es5C4iSyLxRV/gZIzmF5PKa33NetVTXNpXHSu
	JB7Ey5V6hzdXpSdsMcOT93nmNFNoPskCjHp0iWCijR9QtjV2dEcYdBP2fSWfazqmlBzXhJz
	e1mAnL4qPUmn2DTLvjq8MdUdALMtJs5gbYbq+phQJfisZYh6GsF1NvlGKOaQ3jI9Jpo1Go2
	EAweA48jqTNJ8ovyfmRjxhffp8xpOgO98kLyV8iGo4AydUzfcN+IN/VBne33XdhuYZsNGSt
	kCV0Tus/qNOzjiXBzrRfre6wc9dd0+ZMOpl5Bi2I7YYeZoiEZR6Bz4sYt0wRyG6XFqX6xtN
	IVaE5fJeFW3QqCHaJ7VkWshpIY7lN0Om0jJ8MsunHUvLt7ICcvYSnp76ds08XEiFur5BFEJ
	d88WPDg77fmSAD9odPlwpSLa3tgMhYjsv0gqUidcomHp29EnqnYL/4=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

There is a spelling mistake of 'notifer' in the comment which
should be 'notifier'.

Link: https://lore.kernel.org/all/B3C019B63C93846F+20250715071245.398846-1-wangyuli@uniontech.com/
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 include/xen/xenbus.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/xen/xenbus.h b/include/xen/xenbus.h
index 3f90bdd387b6..00b84f2e402b 100644
--- a/include/xen/xenbus.h
+++ b/include/xen/xenbus.h
@@ -180,7 +180,7 @@ int xenbus_printf(struct xenbus_transaction t,
  * sprintf-style type string, and pointer. Returns 0 or errno.*/
 int xenbus_gather(struct xenbus_transaction t, const char *dir, ...);
 
-/* notifer routines for when the xenstore comes up */
+/* notifier routines for when the xenstore comes up */
 extern int xenstored_ready;
 int register_xenstore_notifier(struct notifier_block *nb);
 void unregister_xenstore_notifier(struct notifier_block *nb);
-- 
2.50.0

