Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714352;
	b=gdRDkSnKkDFztATiQix3dg001NFHeZe5Cz02TbyY+w0Ddtu7SlD31qw7tPRRblUixqW6
	 iBtaZgAPWXSTTtE25YG+ZyCVzXBHWtI3sN67Kb5aCKyDWkLo7JkB0G6TWBZ5XkFquu77e
	 oJNsgLqvEk6AZrV/y7Gl98i239K2zC1TwzPQs9/0o7Ezi7X+znoe44dXaRozp7FmhAB+o
	 p55yxH6pQmtWS9JhDDxnB/oqnWi7+abkUXEzvE5RIIcJSeV2fQjEEY/a6upsLScr2KHmH
	 0wqPERge259zmissWXZedpSoxfn/dnC/GSnmyMB70RkvvFuJ0o9wrX+gx862OjOLOqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714352;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=ccP5HEXTeJ0Y3jbzqMoy8v3yamoeB3mTuClgVh9AD5I=;
	b=kRXcMgcAKVct7GKBDcdA8ISjPKSaUWhMEHXrJIpbY7oS13E7pLDziqx9ViJJqdNrX+6S
	 g9NkA2atpAL9hCOtTRssPKMN4aidCuO/7QUYJVJj0mKNrJ+e4d3muz9dhzI5B0/bYius6
	 txDbVbPSPqH6EDxDPw/Y/DOdM5EEuWTiq/tRUwv67ja22pTuP5IcMR+W8YPuvLH4T3BIw
	 vITo8+v0M5t5toviYitPMT7CS2Ud8VTCVsOGcDs3lwp/nSyAkl9hbCBs1ZKDSF+G5VXSC
	 EL3Ucv4mToV8exznOtMz1XRD4bhvNKUnUjQX86gtyXkQ4i62SOOMlEE+v+Zs2gXfMkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="Fw/O1Fi2";
	arc=none smtp.remote-ip=209.85.214.228
Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBDE606D80C
	for <brcm80211@lists.linux.dev>; Tue,  3 Nov 2026 13:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDBDE606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Fw/O1Fi2
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2e987a2ba0cso24075645ad.3
        for <brcm80211@lists.linux.dev>; Tue, 03 Nov 2026 05:59:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714351; x=1794319151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ccP5HEXTeJ0Y3jbzqMoy8v3yamoeB3mTuClgVh9AD5I=;
        b=2nNuGh/yqrwohHEPSVZIkCTLtSJTONU83tc5oNhGvcxPNoUk7EdbJzzGc7HeXkjfP5
         pN8E/ttNiLB5h+f1LIMtwCveZyXmu3fZCAiXhiS/OUN0Ka0YsQ4fu4GGW+bA3MW+x1vD
         vdIDsoCWX5UQLa4jd93pvrPRinsQ+VRKg+QyRihhDb497mSdy7Xg9bo05hC8f/wANfrH
         GLTdgN+/7vUvZTfxyRnDEWe/Rx1bzYZBqLUdyikwHNhz+Ezp4VKhDcPMKQY46QGK9hOh
         XFbbrLXw1c2E8MhoKovqb/1zkf8zdkOtFGaoS76UevKsscpiR4+Q9hnlvBUL7ch+GcmX
         CSnA==
X-Forwarded-Encrypted: i=1; AKwUvBypMDPGYGQRA48BLqyGCnqGwP2sE5oDGWdEYy69pkiQH3oEd9rQH1ieKXgr0bZ4wsl9+0RHqEM3IMA=@lists.linux.dev
X-Gm-Message-State: APuU4Z8CW/Pcm0zqDAPMZoDUCUEKKp9Z7QKCuBVHA3qxXpfUEq81KILR
	Kic95gcRNB+X66w8/ucsKmkiZ1APS04DvNOUvr1SQak9qOit+L83D+h9eQKqqN2f1Tq+mwaK3cv
	pxfP+z9Mx+TuImOHsoxscYCzoKMwfC0LY5GyBIOd8oJUyKovlPksDWUAlbCtSF0m+LSGUFlnQpG
	MHrCoQGvCdhMIzyHlGwREgRYGwqIPMqGuTZ9moxkro2Avt87E+LWyu/ABMHdNuREj7n/nj06OoG
	wEXDbMH7wVTOMx7sdc=
X-Gm-Gg: AYBFou2vavw9qi2wiux7AfDThnqQbep6vmzVCVHd7kONEeu6Ntnai+AM5zuNf1JbvSr
	HRSxxe+sV+ppzJEMQu2i7uakW/ndSM3yKOd4ThtR6sEVc1G+F+N8QXvUl3dps+L0HCYUdGP/n23
	bj3F1Tb7OhYa0u5ZEedXLuSHgFGNajuBH5oCae8i5WwHqieCkxw5F6kTPByL7JwkGGgLncAm7JS
	uiFBvJtvjG+wEA6nTyVn0DUeqxaSh2PD/M3WPET5muOjPc1B52E8qHQNNasIDs0yrIAX6eb+pXD
	hat5pSDZ9XmDf+XKw3ia8ekdFPdLOC3RMzOfiVLLaPGVzmMD/+LfWVdeHZIZyB+E3oVYZC2ODUf
	AART7Wg27vKeLQm6GW2SSOgfCnAjwhOYgQSs6iXgNI37e9CqJrKLrNDpAKivEr5ILPUpdt9Dare
	RWO8KhORzrpKhuwPCIZcliQGnosA0L7RdYTl890KI=
X-Received: by 2002:a17:90b:4cc8:b0:3a0:c276:1ec0 with SMTP id 98e67ed59e1d1-3ae897f673emr9577917a91.28.1793714350864;
        Tue, 03 Nov 2026 05:59:10 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b07c9263d2sm1950847a91.7.2026.11.03.05.59.09
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:10 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a2af4c8cbaso1660844c88.0
        for <brcm80211@lists.linux.dev>; Tue, 03 Nov 2026 05:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714349; x=1794319149; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ccP5HEXTeJ0Y3jbzqMoy8v3yamoeB3mTuClgVh9AD5I=;
        b=Fw/O1Fi2ESlWYRqPBOXJPPXud+P1FXcfYQAkLwCMYFir5zXONCz52n8/v/e5hpta9w
         U8k0nEJfhkI1jedPofPA7urLnD7KMpAISuhycIPrhzgIjhGa/HTQQZ0VdY/dvWbrTy8L
         COCWclQDf+p5VmZbQ5+s8Ybns0T3LzEJElC8E=
X-Forwarded-Encrypted: i=1; AKwUvBzmg4q5fdhmHf4LEPBWY4ERNpaXU8NknjI2JcWIlIGuGGF4wYe/5E2zU5O0rVFzCWyHb0E/TSe6++E=@lists.linux.dev
X-Received: by 2002:a05:701b:2702:b0:143:5cb4:30 with SMTP id a92af1059eb24-1ac5577508cmr18346105c88.3.1793714348755;
        Tue, 03 Nov 2026 05:59:08 -0800 (PST)
X-Received: by 2002:a05:701b:2702:b0:143:5cb4:30 with SMTP id a92af1059eb24-1ac5577508cmr18346046c88.3.1793714347953;
        Tue, 03 Nov 2026 05:59:07 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:07 -0800 (PST)
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
Subject: Re: [PATCH 01/13] wifi: brcmfmac: pcie: Report the detected chip ID to the bus
Date: Tue,  3 Nov 2026 14:58:45 +0100
Message-ID: <20261103135856.3676311-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-1-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-1-b5cbc2cde2fb@gmail.com>
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

On Fri, 25 Sep 2026 23:43:36 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Michael Reeves <michael.reeves077@gmail.com>
>
> The devinfo->coreid field is never assigned, so bus->chip remains zero
> and chip-specific feature checks cannot match. Assign bus->chip from
> devinfo->ci->chip, which contains the detected chip ID.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
