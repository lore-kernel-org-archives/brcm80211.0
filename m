Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794969167;
	b=ZQvvMFLVwk9SodO6dxiA7NnzN/Q1FiM4ynA+ovVui/iLMEJb6w1PIi37DCL6Y5a5egz+
	 sUwzx0B2XPQohpT3A2X0vsyb7uB6rfX/LIonpqbQqayyN+lmG7QlP5MTePDdM5FNKYN6h
	 rPbTmM0rSU6bMZXZxkYYzCzdfiRmDvdpVjvvkAhiQnR/hS9rPRWCoLA/r9up3yKIkILxh
	 DQbus+6zNqMYoI4fuuL446QFTKuHVFxRmfESK00dWd1DVn6yaVueh+VbHOaSdFrCn7wwn
	 MZYgzJDVhvAaMSLFrdhzFoFj0+6ie+h+ANsLFSOOSZmw9wZrhOj8eeJEJ/OurWQCBZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794969167;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=E2JRUt8R+VeUnYftHxj4Dof2OS5CtNJzpWWxSa5MzYc=;
	b=QNNb+tgJgQJGXevlLGLFhmJIDX2Cw8QF247lCqtQQE50I7uK2ecE1kDDtrChHtzb+DSZ
	 RC3mCdvWX8o+SEy7GPTFzimStmDatO2y6ZVtqr2hqlgfjMr8Qa4PxI1XrxTF1QTWgM4le
	 vQTsw0+PoCxunTmXNSjsj0mUTA66WrULMct4nrDTnRwA00/X1zdZGuEpAXEQO0g5PSKnJ
	 KqQBl7USOkbdRWoQeJycsa+HTVx8F8rdRC99s/wBf0JpURF4PZ7tGtMjh/b6sHTpAotCC
	 MPMx+ixBNw25TT1yHKEfkHp1e3dxCMvM9zfKpWpCRNdJRSKeAOeHP5nUMmwSIRMuJAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=HagKWm2+;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6E4606A325;
	Wed, 18 Nov 2026 02:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D6E4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=HagKWm2+
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AI2WRm24908132, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794969147; bh=E2JRUt8R+VeUnYftHxj4Dof2OS5CtNJzpWWxSa5MzYc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=HagKWm2+9onOnETPmvu7wU01KRoZuWua8aVsBa/S12jtX7+Q0QLvctO50tIsc7TYH
	 uqjnEqnF4+0GlWVEW03pjdBQEgpHCLbHf9EfNh7cCWJicvSnW2qqsUBKm1ToYoQSx5
	 pxgZ66UHYqHuqAvU6avGOCGABPPVdePHGZC8NniYFa2a1g6MsmnDKlWiw2tmKMngT5
	 f09TPfp2LzB6bSverTp80jiP9fKe+X5lHd6pJodqkCXYHotjAJsBWimPLl3fvwHAaw
	 Nq6xt2zAhvNDKxKGp0TGHC8GPTqzy8woI7SyKIMWEbPhj9Ds8weTuioi8ErlRV7jvP
	 15r5sD9QxxHbg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AI2WRm24908132
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 18 Nov 2026 10:32:27 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 10:32:27 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Wed, 18 Nov 2026 10:32:27 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>, Mariia Nikitash
	<nikitash.mariiaw@gmail.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"brcm80211@lists.linux.dev" <brcm80211@lists.linux.dev>,
	"brcm80211-dev-list.pdl@broadcom.com" <brcm80211-dev-list.pdl@broadcom.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"morbo@google.com" <morbo@google.com>, "kees@kernel.org" <kees@kernel.org>,
	"justinstitt@google.com" <justinstitt@google.com>,
	"codemender-patching+linux@google.com" <codemender-patching+linux@google.com>
Subject: RE: [PATCH] wifi: brcmfmac: Replace strlcat() with snprintf() in
 brcmf_fw_alloc_request()
Thread-Topic: [PATCH] wifi: brcmfmac: Replace strlcat() with snprintf() in
 brcmf_fw_alloc_request()
Thread-Index: AQHdW3bNnvEHc/p9SkKWCGb74Afaobcx8vYAgAFf6GA=
Date: Wed, 18 Nov 2026 02:32:27 +0000
Message-ID: <670492ee188945f8a3a3b147ae5b840d@realtek.com>
References: <20261014005553.71803-1-nikitash.mariiaw@gmail.com>
 <20261117133150.817227-1-arend.vanspriel@broadcom.com>
In-Reply-To: <20261117133150.817227-1-arend.vanspriel@broadcom.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

> The Assisted-by: tag shows this change was produced with an LLM. Please
> follow the guidelines in Documentation/process/generated-content.rst so
> it is clear what was tool generated and what tool and/or LLM was used.

FYI. The Assisted-by is removed by:

1e035297ffda ("docs: remove Assisted-by references")


