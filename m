Received: from mail-ot1-f97.google.com (mail-ot1-f97.google.com [209.85.210.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029DC2475E3
	for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 20:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789416234; cv=none; b=N0Ike8nnmONKUDe8usv0/I13nocflx+2E09KfUA5DLctvCSsHrtY8uc8EywlkRbw2jq7+IupzXGBRu9PVF40oCzZL5Q4k1wANwK849M+gJ+Vg786Suf9ZAFka2kAGAt0439yAy2ljlDyZYZWo9Zk36BWnbxDPlh+oeN30j0nFGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789416234; c=relaxed/simple;
	bh=WLlK9vA+L8oxHFesUqYqdLRnT+52G2hRnMZGKPaGcEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bcqEDT1x5qknFDT5x6ZIsnc2uZXgWhcuFfim4FXEE2EI06sE/SvdASJkJ7LrJczuZUHQzEsa7bp1ZSc8BrfFKerZTP50kaTZDL9UvH8sykIcVkjOD9KEV+CxwSZR80uxmPnJCAjHShvOytnNzqqhxPJ0Ok6nhPTYBGBonqLi8/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=eqkILolV; arc=none smtp.client-ip=209.85.210.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="eqkILolV"
Received: by mail-ot1-f97.google.com with SMTP id 46e09a7af769-806b1a0f3c6so194421a34.1
        for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 13:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789416232; x=1790021032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C/Rp3IqEWYKaSCV7MCT7ZQkcorp3p2cAmZSJQ5iTWXU=;
        b=26id3ddd/3P2DwLeflONXaeA29TuxojdBe2lfn9/u22v6FRGmNIG/OUlShpYq4V6b2
         mPXs/rCzmPUGw1TafheGJPKD16x9GZ3nscnDYeWmVgQOFB3DdGmgFfe/8LxWJMQO2D55
         qml6xCLghVOI4RPUKWjGBUs8I5r2o7TX0HN/XVDEUb0JrXZRS73m1yywXQPz5vG+CLKQ
         5w/K60e7Zs7G4/wBJQnYY2U+iGak5YT0jNrocHbFGWcmSMdrgncjju53bNfCKOtXhjnN
         SQO7rljX44JAPNnPJv5BvaADjjtBTQq3tQMecWDAHeW0RvFtolKAWhnkFi9IZiGNZfHw
         y2VQ==
X-Forwarded-Encrypted: i=1; AKwUvBzS8jaIuc6Qhv3dFoIjv/J9m+i0Y4ojhCG4byzBdMH8sztHafKAd3o70UqTXFzN2p8jABMtq8VOsGw=@lists.linux.dev
X-Gm-Message-State: AFuF++l6W8mcrknPx2jgujsrkux0VUTGcn0+Xa34JXPAiUFYsFR6LuZw
	2hYv3Q7D4t9/D/qg39RoJyJMg0ky/+OnJtuFr3qp7O4ov8GDxVwf1tOTxKYivFD46sJJPFYNNuw
	GF4wK/omk7xjY+NYzCTXgIDZ31bEqIJASCw6xfceEkfAIBX2HatmQsvshnU8r76PcIMjbPSZBU8
	3nuiRY08vH2fn3mfkv4Q9tyra+T3NV/KfoGr4QnRf0da1Exv6QrsjqkArNK7T51DR8LY4QZORI8
	bbUpp2hSpqwswt3xZdBRQ==
X-Gm-Gg: AYBFou3ngp6vF5MMI29pg2XzRfDHtrDCZ1vGoyjGs9e7hQkjbhR+8E1k3VIdcekeCAi
	72Yx3SCx68KgQTdi/BtlcLHqN5HGz81xYRanSf10qdDqCJLVkDwME1cOCWQKgYKiO0lJhvOdy3s
	b6FRb4+SZDPwqMogr3KX9aB0ULP9IT5RdGjR53D+Anbrf+5RQ/23RjKTv7wWSZDKGw3lZYTOFJq
	5R1IYO+V2qkZHWtTsdVUdv/19FvjM2UiHdesGkPMyzf8Lf3Rmrq7Pz2uS4x1NGNNKDt+H3hjH0J
	YD6N1kbA8yVPL/j0zaX1whSKDN5y52k3RzkZuJsfar61Zk54gW2pniRBu3oNnrximB/Scohtj2G
	AeWPJ/0NHrgY5VKeDR2bzlE6Opi4pEJ3FMeuE6/Iuv75uX/auWYPxaUHaYP5rFH6c3GhhiMRMbl
	j19Vx3iC2Q5pJLUmaHMnVB+kshSrlpg/DVsWSXggY=
X-Received: by 2002:a05:6830:2544:b0:7fa:ab72:9e02 with SMTP id 46e09a7af769-80899e5b516mr2860181a34.26.1789416231737;
        Mon, 14 Sep 2026 13:03:51 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-803f681202bsm6280880a34.8.2026.09.14.13.03.51
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 13:03:51 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67149af6070so1867616d50.0
        for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 13:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789416231; x=1790021031; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C/Rp3IqEWYKaSCV7MCT7ZQkcorp3p2cAmZSJQ5iTWXU=;
        b=eqkILolVwpnyY+aCuqS4cARyhjqOqZFKXfAjrw9iJ21RdMBT1rsiwrgHar7Kgv4sKn
         GaiKTr5mVIqtMBUwYVzG03ikZqOl4f3dRAzEgSckg8nYbaIQKgiMztDkM+/WOFqLeS8K
         GLNPyetpk9PPI43KIGCeqM1/nufaqvpunfuk0=
X-Forwarded-Encrypted: i=1; AKwUvBzJxuxPfPFlWzUCaOqt1sehGAIF2V4PP7Sgslbpz4dY4U5R55BJUxMTRxpVdhW5ccY8xGWBjnveI1o=@lists.linux.dev
X-Received: by 2002:a53:9004:0:b0:66f:c467:f786 with SMTP id 956f58d0204a3-6714e1a4145mr898115d50.100.1789416230602;
        Mon, 14 Sep 2026 13:03:50 -0700 (PDT)
X-Received: by 2002:a53:9004:0:b0:66f:c467:f786 with SMTP id 956f58d0204a3-6714e1a4145mr898104d50.100.1789416230127;
        Mon, 14 Sep 2026 13:03:50 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f202856sm103059276d6.2.2026.09.14.13.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:03:49 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Girish Rudrappa <girishbukkasagara.rudrappa@infineon.com>
Cc: linux-wireless@vger.kernel.org,
	johannes.berg@intel.com,
	brcm80211@lists.linux.dev,
	wlan-kernel-dev-list@infineon.com,
	bogdan.nicolae@gmail.com,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH] wifi: brcmfmac: Set extsae_pwe parameter to Infineon firmware in SAP mode
Date: Mon, 14 Sep 2026 22:03:46 +0200
Message-ID: <20260914200347.1743016-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260831061213.240270-1-girishbukkasagara.rudrappa@infineon.com>
References: <20260831061213.240270-1-girishbukkasagara.rudrappa@infineon.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Mon, 31 Aug 2026 06:12:13 +0000, Girish Rudrappa wrote:
> Parse and configure the extsae_pwe according to the information from the
> supported rate/extended support rate and RSNX IE
> 
> Parse the beacon IEs on start_ap() and set the extsae_pwe iovar.
> Set sae_pwe to 2 when the RSNX IE advertises H2E, 1 when an H2E-only
> membership selector is present, 0 otherwise.
> 
> The changes are tested with FW Version 7.45.286

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Girish Rudrappa <girishbukkasagara.rudrappa@infineon.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 77 +++++++++++++++++++
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c |  6 ++
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwvid.h    | 11 +++
>  3 files changed, 94 insertions(+)
