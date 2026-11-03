Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714390;
	b=lXEccH+j+VFECGCVUNE40WvUE2otlZdouhC8ZnEkvOse3pivRN0Lk6BZzOOSTYM1bhPw
	 qWvJnrid+K9UojzmdxsAZhxbiFK3dsgybO2oMAG20uY3kTOm1P28adk6sdJ7/GbJ+pgIP
	 F3OqFbAi3jzoi8C2UiNjpbjhb6mUSu1GG+6jrZqjTI3hqGwloJUA30X2uP9z+ySVfqdQu
	 G9agyU5erBFiA+x+L3pAg8ANVX3bQjbyujo+gMBCvpUC62aZYcXt6XZyzq2BN6+0YUuwD
	 sjPSTZYWgxV7qZ953IHxrwM6pRszyWHHt66thUOgvbytvbjYLBzW5I186WqYbLdr4Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714390;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=BPfwhnSKhhImT2MSjvVFfyGTbJZ+CXv0gKlK5lwoVaI=;
	b=0XEi9UNMv4lanTGoIHsB7VfxNB9kxZ4lMVNovmFVN4wJUJYw48L4wpF8IsUk15vaPnfw
	 4gsZdTxxVtK4J21mAacI7jIOk6V4nHRONQHobvzjHulRIQUyZF0BamdNjs4Qc+rfnKXYu
	 41QmBuUdkKlgEOJs5pOEq3w2d/19WKn2OebPqdk1/xlGfmIgPai/WMEK2vNcFnGvP4Gjl
	 +pBojZKRe03P8+5Fk4HVPdWppK5CZYo4CLw6w10dWQhu5A8UfwV7ySVmkuABzWzf50GRn
	 RwzdVijWuUzM19wI3iKBGfq6i36IZoAHGsHKjN4hvWgtwcOxCJI1N08nq/oyuP4Szsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VNdlWMY1;
	arc=none smtp.remote-ip=209.85.160.226
Received: from mail-qt1-f226.google.com (mail-qt1-f226.google.com [209.85.160.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFE46083608
	for <brcm80211@lists.linux.dev>; Tue,  3 Nov 2026 13:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAFE46083608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VNdlWMY1
Received: by mail-qt1-f226.google.com with SMTP id d75a77b69052e-53664b4860bso45052651cf.1
        for <brcm80211@lists.linux.dev>; Tue, 03 Nov 2026 05:59:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714389; x=1794319189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BPfwhnSKhhImT2MSjvVFfyGTbJZ+CXv0gKlK5lwoVaI=;
        b=RA91c5SCcwK+AJdQWZpQh9gdv6II12szDyjVYQ9GfAPuTLlO3bVanAENBl2gNRIvYF
         wssIhfCHzyiTamvUE/8SKsxViVVU4PoB6ZasqpkPtDV/fFk5l6kEu+hveCnCRz3e3Bbs
         0AUzy+seJmZ13Yqm33x9do4XLSS0fRuk1yMrE6Vymuo5IC6r+gGuRSYUZh1JDh1AtQFd
         RDy5sq1sOcA9CxXKyMWs5Nh4eWKGkij5SmQt8m0+/EYtXVLW/Zbj0QoxizEugSoLi+2P
         1WjQ2zKtIJXXnfeH5j9It53IYUnFIKgOrhKn88xadllGOUA2VWSxJ1PwkCUsIklvPshF
         oBCA==
X-Forwarded-Encrypted: i=1; AKwUvBzXk2bsLBZtTZ4Vd2ofeH9QBE2Ujizb1EImONWp7fa6iu/pgg+5jdjecc1qAHcTe62ELR49FK4kFwQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z8hD3+CvycBIK19iPiaoOZfZRvKRvRXPhR9zO+NYwF/gqozhzJ0
	JXCKP4cjC+Wvsqpl7U0sA0FzfDGMUyEWmimteCxx2aJPghH7qRxYfQd8XuaI92IpECM3jWb8drE
	Mans4yXh+5D1ajODorvcWMvlTEt8fppWU//VypG9kp9rot+6b/D/+EM0hL37TLBV7BObavDBTz9
	deQzBR86gGXrwfSoBN7oxSttoEOLP13oZBfdu0IwsA7IzSPaFVJaPFgg7KlWWLGS7mPDWQ4tX7L
	ssb/W3wOQ9auYXvgb1wtA==
X-Gm-Gg: AYBFou23G4XayM7rSna8ja+K2pHou1IgLY7MHSPdjYVNMUHCG8z5vrc+Qo+KWTboWts
	P3EiQMnw+Nt9PhDuMNXaA8piAPcVzfD0XA7B7rV4q8QHrd50TkhyyrcgSvqNuNrxHh6UadOYV/P
	ftU6afDC8mKkpiiNuTBiZ+rNQrZC4pkBggzWbUMHj/gAvBnDprhFI0b6E8fgqNTxHzSFTNnR2nQ
	rGq/9BxM7x7jrUElFKzK9bmu7CtQeQSSb2WrR5Wq7NlUn23R83bbf7GKDX6N9O90HWNiiw1cOBq
	cBgTC5giC79+241IJ/UZq00iA+x9o3GXI2yLjBzpWHHHtLqjnsi80FwvadjC/pq16uj8qHOO2cn
	DPy/6VRrVNDWMD+I/5miqmiArMuoTH4xSlr9+7USeFGNX3MzCSQqtkZu5KUGlCek/1UvGErQzwB
	xHiUad8bUBYuqh1lTYx2fNvxfuXSddv2KZ0JpKu9E=
X-Received: by 2002:ac8:5dd1:0:b0:536:7cc1:4b6b with SMTP id d75a77b69052e-542b6d60c04mr215121681cf.27.1793714388717;
        Tue, 03 Nov 2026 05:59:48 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-91ca7f28afesm1612406d6.16.2026.11.03.05.59.48
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:48 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1acbaf81bebso894349c88.1
        for <brcm80211@lists.linux.dev>; Tue, 03 Nov 2026 05:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714387; x=1794319187; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BPfwhnSKhhImT2MSjvVFfyGTbJZ+CXv0gKlK5lwoVaI=;
        b=VNdlWMY1OV6euCnF0Lqi+vDdTwT7xi++wHv8rWtcfdaaORgd4CXN/6i6ymJuUzZW0n
         DmlsL+Hj7GOwHTUfVpBhFWVM0rtfXsGcJhUBSKQ8cZHnaWbmEcUMjhnH2v0WCNzu9CNS
         jcGuwnGgMztdMD0DLpo08DGY+O20PRwvNTraU=
X-Forwarded-Encrypted: i=1; AKwUvByO8oj0DMUdk0FlCnszUueGCKF5XSpHra10IWrJnVVCWeZXYRXbG1cVsp5GWs9Z79eZgiCgV9aMkr4=@lists.linux.dev
X-Received: by 2002:a05:7022:b059:20b0:1ad:3402:733f with SMTP id a92af1059eb24-1ad3420f9a1mr19288275c88.44.1793714387400;
        Tue, 03 Nov 2026 05:59:47 -0800 (PST)
X-Received: by 2002:a05:7022:b059:20b0:1ad:3402:733f with SMTP id a92af1059eb24-1ad3420f9a1mr19288228c88.44.1793714386672;
        Tue, 03 Nov 2026 05:59:46 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:46 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Michael Reeves <michael.reeves077@gmail.com>
Cc: Pieter-Paul Giesberts <pieterpg@broadcom.com>,
	"Franky Lin (Zhenhui)" <frankyl@broadcom.com>,
	Mathy Vanhoef <vanhoefm@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	asahi@lists.linux.dev,
	Hector Martin <marcan@marcan.st>,
	Daniel Berlin <dberlin@dberlin.org>,
	Janne Grunau <j@jannau.net>,
	linux-kernel@vger.kernel.org,
	Hante Meuleman <meuleman@broadcom.com>,
	linux-hardening@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH 06/13] wifi: brcmfmac: Load signed PCIe firmware images
Date: Tue,  3 Nov 2026 14:58:53 +0100
Message-ID: <20261103135856.3676311-10-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-6-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-6-b5cbc2cde2fb@gmail.com>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Fri, 25 Sep 2026 23:43:41 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Hector Martin <marcan@marcan.st>
>
> Signed PCIe firmware needs a signature and a memory map describing the
> image, signature, verification status, and bootloader heap.
>
> Request an optional .sig file and write the signature and reverse-TLV
> metadata to device memory. Describe an aligned heap after the firmware
> image, keeping the metadata and end footer outside it. Require NVRAM for
> signed images and preserve their reset vector.
>
> Request the IRQ before starting firmware on chips that use signatures,
> while keeping ring processing disabled until initialization completes.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Hector Martin <marcan@marcan.st>
> Co-developed-by: Daniel Berlin <dberlin@dberlin.org>
> Signed-off-by: Daniel Berlin <dberlin@dberlin.org>
> Co-developed-by: Michael Reeves <michael.reeves077@gmail.com>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/pcie.c    | 267 ++++++++++++++++++---
>  1 file changed, 233 insertions(+), 34 deletions(-)
