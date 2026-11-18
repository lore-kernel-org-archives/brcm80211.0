Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795002644;
	b=jPUHWOK47gWXpMGeumhfnJPmruzTFz3UbeLVeguxuD0j4J4ONFT87kUw2L73rOf0/sY9
	 omQLuW3QhkCWWxO+XmsvS3q7oMc2pefFpJP/5V/EBMSvGXMUByyyFK190g5aBCe1L38Av
	 mSzFLcuDsmcRhoIZn631nnlwwR5qhrmQTi9/a7AI2PGO0BxckSip0sl6kV2RLwJtLzHP0
	 CLWGU4/nhwPSSaYajqamht465DAPPm9vC1LbjKzOCFdCjR1e4KUdaFIzB1e6vqRCLyMFg
	 QdPG8sKDhgp3sWhQweHokE3hR25/GOWtyristDbzAiE2DsbzMa8l4YhwWuCd1QGRv7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002644;
	h=DMARC-Filter:Date:X-Lima-ML-UUID:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=vMy8NFS01vxltqZIpdGgfKTVR8quXjdC98ZbChg3Efo=;
	b=4oHGPnCrf2+c98JeSOGLYgFaov1ugIgUu5zj4H38UrsSJaIVmEdDqOaAtQyCqnkTF2Ur
	 pyca1P5QYH176o93e2EAeygHJz9alzbGvqcUaxCqneiAcYy8V1VbUFnDuNKrV+zbZA8kN
	 DDojvG3vD87F8tj1ygeP++nIGsxJdp8sx1Gzng8Vao1KIgYRfciJmyOmY2L6hHJSL1mCl
	 dBLB03JLNbH2ZjEaz0+7KwDQcDvSJa3scZ9/s/ALWcMiQATt8HcFWoMryGqB9TpRKVXcC
	 KwTuyeewIv5RmLLTMvdQ6kmNazKEsqFeaQ+hax+Ih9b/Ul+Ps9cY8P16aT4XLJidleQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=KhgxiXR6;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0BB606A320
	for <brcm80211@lists.linux.dev>; Wed, 18 Nov 2026 11:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B0BB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=KhgxiXR6
Date: Wed, 18 Nov 2026 12:50:34 +0100
X-Lima-ML-UUID: a8299ef5-1549-48fd-aa02-7052a7a551b5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1795002640;
	bh=vMy8NFS01vxltqZIpdGgfKTVR8quXjdC98ZbChg3Efo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KhgxiXR68Ql7+BdwY5WBWdLk38/0HlD5sycW1/o4sc4Q+OzlWlIyyhFhXw7OhQvH2
	 BZacg/E7TU12jmp+1KWVmxtT31e/4VbzDU1mEV7fKDL2YfHxZpVFIgJaIyyaqdWYgT
	 m1rlsHSJGArmK2C/FHtaIOuTxxo47ExDUmMUnj+N04lrlHHnd8hRC150rpX0joZIAN
	 u2hAYsNLHWr7Z7sy1sGPraW0Pf3LHa8BvOz4NlDjWjUR9a800NQrE1k/GWyPar2yuU
	 F75BOjC3yvpohAZYaWCl9nmU6SMeDWlhGlm1nclAyEHj5iIubNGU/Ey7TI/JjVYzv+
	 PnKV1v22kmeeA==
From: =?UTF-8?B?QW5kcsOp?= Eikmeyer <dev@deq.rocks>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
 sebastian.reichel@collabora.com, Lukas Klizas <lukas@klizas.lt>, Yossef
 Osman <Yossef.Osman@proton.me>, Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH] wifi: brcmfmac: reload the firmware after a missing D3
 ACK
Message-ID: <20261118125034.4d257b01@kait2en-mbp15-1>
In-Reply-To: <b8ccdaca-ce91-44f9-925d-eb5ef6b78088@broadcom.com>
References: <20261104151616.70623-1-dev@deq.rocks>
	<20261116110839.4481-1-arend.vanspriel@broadcom.com>
	<b8ccdaca-ce91-44f9-925d-eb5ef6b78088@broadcom.com>
Organization: KaiT2en
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 17 Nov 2026 13:12:49 +0100
Arend van Spriel <arend.vanspriel@broadcom.com> wrote:

Hi Arend,

> It is all you ;-) so you can probably confirm whether this is indeed
> superseded by the series mentioned above. I marked it as such in
> linux-wireless patchwork.

Yes, confirmed. Patches 3/5 and 4/5 of the T2 suspend series cover both
parts of it.

The same goes for the older "wifi: brcmfmac: handle missing D3 ACK on
BCM4377 T2 Macs" v2 [1]. With Michael's mailbox over the control ring
the BCM4377 ACKs D3, so that workaround is not needed anymore and can
be dropped as well.

[1] https://lore.kernel.org/all/20261001085308.1688049-1-dev@deq.rocks/

Thanks,
Andr=C3=A9
