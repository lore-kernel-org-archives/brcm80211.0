Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919932;
	b=Wuh/U9/7MQILrCBYKgiMfXyLozZIxu5d7FX5J2YwV0xBHw7c7hyu1fueSg1Q40OxXqgn
	 B0Yp3za/ckEmsegFdeiyHHag1Dbt4X7yoBdiEVZaYhGmpZP6QJV7mnE9DsvTd1DGAjvkA
	 UiE1cpAiECV8ayJjUgGFdOL5Y8BhP8bwqdE0DIY0LHYEE6OfZRR45uCcYG4DaZYF+XoUL
	 uW8LaBeEwu/jiNkosv5IbZAySdo+oHmS1zR/lBQcreIDj4lU3gYUzLKamNjht+KmcZXnn
	 gTVT8KAa8aoD3UBzFzkIdpqQX/ddhlowe4+4yquBSn7aFdbDg45pt4YnKZB6WVHvM8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919932;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=qF5pRgK1fLCyx67ZJUqqMabNrPbzcG9t+q8YanBUEjo=;
	b=tQIDqbWkTTojKtPMbBpOKNobCIqYwCFVweJzb8O66GRMGYTusxlKj6XJ63jXS4p4T+LL
	 hMWNahDn3pDE9s6dD1igC8n+UjAc3AEFM4O0pxqstCkesNfw/OsPIn8ndS+7wIOmQlaVQ
	 NY0z26PhaKrgT3HFC92JK8reAGnChk0oGE4Xrs09HJblJ/rnVGjFyNA8VlzaOy1lJpNue
	 smVSn+Xu+RLGBMcHla5sXYnVBQ9iZq84X9P34Tz4U9N4YErQrvzakwRDnto2IZUjVxrD9
	 uuJJF88j5IwnJ0LZz0S0xofM5hHYjIvdIQnE4KbEGdkZPfMu8MKmUo5u3qlr5/4Si8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WEbfRL9S;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B88606A33E
	for <brcm80211@lists.linux.dev>; Tue, 17 Nov 2026 12:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09B88606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WEbfRL9S
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso2600322a91.2
        for <brcm80211@lists.linux.dev>; Tue, 17 Nov 2026 04:52:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919931; x=1795524731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qF5pRgK1fLCyx67ZJUqqMabNrPbzcG9t+q8YanBUEjo=;
        b=wiDjYsQhW9+I26d8hUcBAlSxaPeGOQ+egX3C/eQgMdxVVRSQVERW1zu4k08cQQraRL
         YtIh2N9dDbznd2g8Y5g1v0/5r483GiMggAAEw8dEqZu60qdcqk8aAefLEttDWRmCjDiS
         5wm+mfD32ozjP5vGUokAmwzgC5gr+Aa+2wltjU+2qr4eZVwauGqoZPYSwv4GhBf6Jl0+
         SGuffYAHSa2wFT3iwMrVyEKrsDNxe6AYNNEZ1pQXyHp0Rig/JlNLvvaeXgMQDI1XRY61
         aHzOur6M1+TjERl4tjkobwifCV8KJ7jnJx+ClDn2VtCC/VMod1bSuwC8+5jNUv0b3ymA
         Afew==
X-Forwarded-Encrypted: i=1; AL+hErHUOr46NioMVL99tUUjcH0ijo+g70kP6zpgYA59e1LTjJCShpdjiyw+lJBpUINaE3xgrF6soel9qaM=@lists.linux.dev
X-Gm-Message-State: APuU4Z+J03ryitqh7TgiieRRch6/uPd4nOrIcqZmxS9SfAZ7BZXMUBJt
	hHwdg3OG1MSYyfIwFZAPNwdGgKQZ4ts4UZJFdPRMfc6bIa3PdVY/QJ0VDjLHGdrvTAQxfaXjbOq
	T7zBeyCXN7XjkFKyZrS84qLQkpOqE15Gk8C9V7boi0ny8hwUOiJLojMU+UM4A+akyH+6um4eKob
	IkhkKUg0QysEe3l3AfGg0Aii1yyIBmNsWF3kxsuCmYJ0VgO1rQnpQG6jazFKOj9z6p3/+Q5IO6C
	A7/CpyLrVjuvaMyFTjqVw==
X-Gm-Gg: AZFdTZfgVSMp62Vizxe2vqL0lbYtB6DT3k+t/G93ATs+8r3VakQbx91bldiEikzQIQ9
	9sCRW5hAHCAOt2B93G8D7yaMNy64tFU0nHPU4hqlCFPH/cQlBYVC70Z5VDPuVBvO5r0iSsGsweS
	czUMiD6pc3hCTx2jTUiYQ5sCC072KvyHFdwRULrzwAkbjy54l8vt0xkGXZuL9/uHfem4X4Bd35u
	4/iJjrDXu4+wvfpeT+gxRhu+HkBmph23Q6cScucdPt+/QYGj6YyHyYb6pdNYi/oxZUcJBFdjU5z
	GdCnyfBctAojpzak9MZXqsiUaXTegPlHtt8G7MfeDGVi5wl88RVFU0/1ZyCB2zLmKWVE2IOIa/a
	LbWmFLZDfeuaGR9RABtiI+6xCQFtlCZem/FPBl7qHNBzKsCZxpuIPC6OJQ7pVIFekyHqT116wtb
	K2uTBuiY4dqPq99SEQSM3oumgF0ce9fjlHrhjwod0=
X-Received: by 2002:a17:90b:1b06:b0:3ab:36c4:b4ff with SMTP id 98e67ed59e1d1-3b1b0a0d922mr13626922a91.24.1794919931281;
        Tue, 17 Nov 2026 04:52:11 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3c92ee62csm115341a91.8.2026.11.17.04.52.10
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:52:11 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-945b0154705so357791485a.3
        for <brcm80211@lists.linux.dev>; Tue, 17 Nov 2026 04:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794919928; x=1795524728; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qF5pRgK1fLCyx67ZJUqqMabNrPbzcG9t+q8YanBUEjo=;
        b=WEbfRL9SXqLuxt1jFtLNN8kblJvO9YR7vNlfFUQZUOKoG8sCL4KSlRvxza/1sRou2U
         NC/xh4mQOW4E9vBaExdIlu+LUpR9J88ykYWo6cvcSrrKDN9nx69P79fSpPswWliPRYqE
         tk+yZlld4OykV2w7wHR4JURnMU+wC3/I46CdY=
X-Forwarded-Encrypted: i=1; AL+hErGiORAjThlPYbVWmj7/G+tp4R4xHfqi6ByyqgcEkqbzL0HPB/h2xxpWF24O4dTnMRDFlt9Gniq12J0=@lists.linux.dev
X-Received: by 2002:a05:620a:8908:b0:93f:735:6c83 with SMTP id af79cd13be357-9494bb3caaemr2034707885a.56.1794919928612;
        Tue, 17 Nov 2026 04:52:08 -0800 (PST)
X-Received: by 2002:a05:620a:8908:b0:93f:735:6c83 with SMTP id af79cd13be357-9494bb3caaemr2034705085a.56.1794919928133;
        Tue, 17 Nov 2026 04:52:08 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c870f31sm1089421185a.27.2026.11.17.04.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:52:07 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Ragul Balaji <ragulbaby@gmail.com>
Cc: Ho Jie Feng <hjf3108@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com
Subject: Re: [PATCH] wifi: brcm80211: move the USB bootloader definitions to a shared header
Date: Tue, 17 Nov 2026 13:52:04 +0100
Message-ID: <20261117125204.3992696-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112050816.2795512-1-ragulbaby@gmail.com>
References: <20261112050816.2795512-1-ragulbaby@gmail.com>
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

On Thu, 12 Nov 2026 13:08:15 +0800, Ragul Balaji wrote:
> The Broadcom USB bootloader downloads firmware the same way for other
> USB chips than the FullMAC ones of brcmfmac.  Move its commands, states,
> firmware header and response layouts from brcmfmac's usb.c to a header
> in the shared include directory, so that other drivers can use them.
>
> Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
> Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
> ---
>  .../net/wireless/broadcom/brcm80211/brcmfmac/usb.c | 68 +---------------
>  .../broadcom/brcm80211/include/brcm_usb_rdl.h      | 78 ++++++++++++++++++++++
>  2 files changed, 79 insertions(+), 67 deletions(-)

[...]

> +#ifndef	_BRCM_USB_RDL_H_
> +#define	_BRCM_USB_RDL_H_
> +
> +#include <linux/types.h>
> +
> +#define BRCMF_POSTBOOT_ID		0xA123  /* ID to detect if dongle
> +						   has boot up */
> +
> +#define TRX_MAGIC		0x30524448	/* "HDR0" */

[...]

The move itself looks fine. Like the series "Move brcmsmac code into
brcmutil in preparation for brcmbmac" (posted a few minutes later), it is
part of the reorganization that has to go in before the brcmbmac driver
is sent again, and nothing else in the tree uses this header yet. Keeping
the brcmfmac and the brcmsmac parts as separate patches is fine, but
please send them as one series with a common cover letter, so the shared
pieces are reviewed together. Since the series then touches more than
brcmsmac, rename it to something like "Reorganize brcm80211 code into
shared directories in preparation for brcmbmac". Can you clarify the
additional sign-off from Ho Jie Feng? Did he co-author the patch or did
you use his (earlier) work?

Regards,
Arend
