Received: from mail-pf1-f225.google.com (mail-pf1-f225.google.com [209.85.210.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEF12236E0
	for <brcm80211@lists.linux.dev>; Mon,  6 Jul 2026 10:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333531; cv=none; b=P1f7+ckpDnS1TVW7idx8LV25ACZ/ZBojXN9PHTc1WP3M/JiHztEjDkkHHdnoHuQy4pO5nfiFR20DK0UQPo78SQTTP0yLaJ9TyB9sTYrCPaCtyhOB69HGd5BA/5Id45qihi+uprvySw7jbamVqKh5jY+E00jTtUpzSaSTkLZMl+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333531; c=relaxed/simple;
	bh=wXkmloe32wDeBpHMbchLne5t/itP8cURECNWNe6OBPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tlr2489hQFOAx0PP3QGKEH2AOXEo4zs+5peWGgQyahkAHhymH0q3cCa6PZ7243dd3wqjdyD3fW5My19vVcDg3yUZCiTsXSrhRds+Qf14YrC1Zwijkil5H43oZ8YR68z963IEBTxe9wC9VnRtIpBFkfVWtj/KpIIoYNOuqYdEInY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=SLq96Eya; arc=none smtp.client-ip=209.85.210.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="SLq96Eya"
Received: by mail-pf1-f225.google.com with SMTP id d2e1a72fcca58-845e47133c9so1859992b3a.0
        for <brcm80211@lists.linux.dev>; Mon, 06 Jul 2026 03:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333529; x=1783938329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CA5p8dVeCW7g5NSaVGN5KNCsgXkRD8Ko8sUb8IXK2EM=;
        b=prnqUeaBuCesVvWmtj5/avNUIoFIuqftrGSKkq5VOHKqv7sBGVYaAVr02FpdBQbVZW
         dcEP6+N3rQq8efXSTqMH9tqHg/v/1Oiwujm/8OLwn2Qhr38QmrgTxQmi9/qR/xENzrgY
         WGYUfqpLSx9B2jhj09gf2ykqh0IYtD+cNpTLr0F7NmKVOTClp7tYFOz+bjHxFCk6XofL
         ikGQ6tfQOunzW0zc5NYZ8a7a3glqLHRPFAU8EWmPIEiPuChtswV8iDoDEJ6LqOkxsFyC
         yswnCP48D0Dw0YcVRddNyPr6JK74GkFIuUcUUuR5Gfy1rRWf0AhJ30V1YsCtR0pVmDHf
         N5Qw==
X-Forwarded-Encrypted: i=1; AHgh+RqxEAtQF0bzRi9m2Ppu4E4QYjBVaKAdbR1CuZKezaQVmOmo9aJijHR2rA+0sjuTezhD2UHZyzihouM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0zGYXucyFN1Gm9yiRf2+LJLHbRdfCCQH8UU0oCbn69nHAng2k
	x/pNxf9Fy2S6/h44F/Aaxs9snauP58IQjfSiCw/DfnYZ0KCEXTOjcAg5QdrX+GyKkg4g5330IIQ
	Va3EvQAQDeBk6j2gEDwN3SA4s8rz9tWrJAgA+luQ7XMQJVOG3Y8uXK0GGGwqPzpKY62avoz9Tgy
	zylLf7ZNjtXWEMeG3qDI8zjS7+NI5+by4gp1HJL+nwcK00oje8EIyllnkBIA0bP0hwcWbHOttVu
	B0JlqRrgJkTK+yae7Tx6w==
X-Gm-Gg: AfdE7ck+VSwfeQaETj2GwFeIYvgAbhSjj2Apw61h6aha7230u6xkx2Gd9+DAWyfGruF
	1UsD1+DXixBLxXMze7+Gls2VQSW6mocy3+yNmjjDA4dJZ2wvh9KvqI1PnZ47a4f967gpC4km/4A
	f36sUtXKiM4D8GtAQk8Z/obVS6YHVVQsSXW3j+8ioYRRMw0OyC//Vn3wOvn80RbVJNIN3zxCQ/r
	dfGenq3LCFYlwBD3RG3mwwB+Hdzq3WHPhzN+eI5fcnCSh7lTUaijolHq87vSY5OTHeqGiUp3ZRq
	iQZGQWgUsF+my0AS9Br119UE6tIJsvmgwAjcfNAeYeinVdki2c2dO14FDjsgLBHJoaojRdncBwL
	z0od35/0jioNrYJ4/dZHQdct9XsKjbml8OZ4kmoK/Xr0zR39kbd0FxCEbbhBwGuhM03k4zvrcQb
	iAJ5HmBlNY/p6fkorDbIcpFbzv12xjIwlBuKmBq9+/H0BC5HkQhmyU
X-Received: by 2002:a05:6a20:e68c:b0:3b4:6af4:bdce with SMTP id adf61e73a8af0-3c08e84e5e7mr22802637.20.1783333529475;
        Mon, 06 Jul 2026 03:25:29 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-116.dlp.protect.broadcom.com. [144.49.247.116])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-c9e922c7fa6sm1018261a12.8.2026.07.06.03.25.29
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jul 2026 03:25:29 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e695a3b28so374536785a.1
        for <brcm80211@lists.linux.dev>; Mon, 06 Jul 2026 03:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1783333528; x=1783938328; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CA5p8dVeCW7g5NSaVGN5KNCsgXkRD8Ko8sUb8IXK2EM=;
        b=SLq96Eyapqjv6RCfoI6U5/cbkMXYgsM75/H91gNXFO+e244WFRIuYD9U3aFcecgyyq
         NlQZ+P/Mwuc6fUeERetJIfrx7SOI9A4z4UPqtwwZnVYPT4zLycfDHMKHPMdKKkYr6oyG
         Av6X9bw/65QNLY07vkxZD3oAj+rmKC/lyxdeU=
X-Forwarded-Encrypted: i=1; AHgh+RpEpoqKFwKamnNQnOMi+F+InX4fPezkTnn8hSEBENm591zcz8qBidcmH/gdCHbvGlScbtQz9IcdDVE=@lists.linux.dev
X-Received: by 2002:a05:620a:261c:b0:92e:650f:c39c with SMTP id af79cd13be357-92e8b25d442mr1666945985a.3.1783333528133;
        Mon, 06 Jul 2026 03:25:28 -0700 (PDT)
X-Received: by 2002:a05:620a:261c:b0:92e:650f:c39c with SMTP id af79cd13be357-92e8b25d442mr1666943585a.3.1783333527680;
        Mon, 06 Jul 2026 03:25:27 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90c926basm873038785a.22.2026.07.06.03.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:25:26 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Jason Huang <Jason.Huang2@infineon.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	Kurt Lee <kurt.lee@cypress.com>
Subject: Re: [PATCH v2] wifi: brcmfmac: add DPP support and fix fw-supplicant/P2P interop
Date: Mon,  6 Jul 2026 12:25:23 +0200
Message-ID: <20260706102523.1430606-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260604034227.590951-1-Jason.Huang2@infineon.com>
References: <20260603035722.145894-1-Jason.Huang2@infineon.com> <20260604034227.590951-1-Jason.Huang2@infineon.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Thu, 4 Jun 2026 11:42:29 +0800, Jason Huang wrote:
> From: Kurt Lee <kurt.lee@cypress.com>
>
> Add DPP support in brcmfmac and include follow-up fixes needed for
> reliable operation with mixed security setups.

[...]

>  		if (sme->crypto.psk) {
>  			if (is_sae_akm &&
>  			    profile->use_fwsup != BRCMF_PROFILE_FWSUP_SAE) {
>  				profile->use_fwsup = BRCMF_PROFILE_FWSUP_NONE;
>  			} else if (!is_sae_akm &&
>  				   profile->use_fwsup != BRCMF_PROFILE_FWSUP_SAE) {
>  				if (WARN_ON(profile->use_fwsup !=
>  					BRCMF_PROFILE_FWSUP_NONE)) {
>  					err = -EINVAL;
>  					goto done;
>  				}
>  				brcmf_dbg(INFO, "using PSK offload\n");
>  				profile->use_fwsup = BRCMF_PROFILE_FWSUP_PSK;
>  			}
>  		} else {
>  			profile->use_fwsup = BRCMF_PROFILE_FWSUP_NONE;
>  		}

The else branch resets use_fwsup unconditionally when psk is NULL. For a pure
SAE connection (sae_pwd set, psk NULL), brcmf_set_key_mgmt() set use_fwsup =
FWSUP_SAE, but the else clears it to NONE. As a result sup_wpa = 0 is written
and the SAE password path below is never reached, breaking WPA3-SAE. Same
problem for 802.1X (FWSUP_1X, psk = NULL).

For DPP, use_fwsup is already FWSUP_NONE at this point, so writing sup_wpa = 0
only when use_fwsup == NONE would achieve the goal without the regression.

This patch will also conflict with the pending "wifi: brcmfmac: fix
802.11x-SHA256 call trace warning" patch as both touch brcmf_set_key_mgmt().
Please rebase on top of it.

The remain-on-channel wdev tracking fix is a pre-existing P2P bug independent of
DPP. Please split it into a separate patch with a Fixes: tag so it can be
backported to stable independently.

Regards,
Arend
