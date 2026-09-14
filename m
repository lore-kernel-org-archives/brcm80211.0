Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DCB3EDE60
	for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 20:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789416273; cv=none; b=r6A6gKMUIS8EwbgyxpNfEUpGFH6xbReMaJgm1JdBZeIRav6TuYqRRNTKyjNzYN56PcUGGyg+rPP0Tw6vxSAVrGj5FL9vOemTtjNCfrrZAi9PfG3QGqxeqgVi6o03T7JGg5vXAL+w3UhfhCl2XaYjnmzJWMIhVCTmdHeBCKJkpHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789416273; c=relaxed/simple;
	bh=Wx70fEWB+1uw48fVGGi8fVV4K7wRL6TfTb69gbtw5VM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BIOoxQRcYUr2k4Wa2/GswJ+bf1rxREnWKTVQEDksOoZ4nXkAbF/LDVZr7AChoqvFklqCxmuh8Xd+ofcf2kWi+ysFBaY1/qWoxENABCPQFLh0jxgkXoLfy5yUBsBB4bUyLxiVS1slMtFMqWg1AUL+IXiWoASgtVnOSd7Hs9Wa3Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ZDwPS0rT; arc=none smtp.client-ip=209.85.215.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ZDwPS0rT"
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cbee846deecso4907980a12.1
        for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 13:04:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789416271; x=1790021071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=++FAD+vvqLJLnQF1OXQZPWPJ1aNaoKmbxXpG1ktiVXY=;
        b=tEjcj7GVAaOAnWwK84HfYCo0K+zc9RdjucgQdN7XVdmE8LXDjMGggFu4mi9Y+vPAVY
         TlQIpCV8W4gjfoL+HKSadF8/0H+Hd3AItchfLhrjOlQ+YQ1GFYmBGin942h2mVQCLtUD
         rSKXwaEKJB3ImEEYFlVH95gMnsJDFQwVK1qWbg6SSDV1KiZpeCi8mlh9G4ZQL09XX7KZ
         farvSWO1rjPpjOavxww/sKGDBooLznSx/iK6j41Bz4ThmUWO6U9ltPvuF5A/tebtkEeU
         E1cwXypDRl66mJExfMwdRSKygxMjNI7i1Hk/vsG9ngBxxSsu066IvxlLvnd4i3jrRlg2
         6gpw==
X-Forwarded-Encrypted: i=1; AKwUvBxpMVViZMWm+qAe31O2EqU/5FhSYlz2496RYeze7w+mhmrDISM4V9+1nQN+SucQngTuhAz5As5ziDA=@lists.linux.dev
X-Gm-Message-State: AFuF++kz6Md3EhngrcHz03Nch2aIhHlvYehv/Wb9SkYuBJvBf53P7mhE
	Z4/XdXWpFWS8+epDgIrv6ZWJkUquDIFS9mVKtbQpvabiWMtFYVa44VdttUh/DmhVhplOOjPm0od
	Yqy3g9r3uVAHo1js9tqq0LbEBkOOqiav0AjIt4HBgqfFCoWmZqthFEGaOwJj3ZC5o04gEsFZ7v5
	Zui3KtlP05avaR3QCuU0VaFprwrISuS3a0zACoJvGrszRfjuJyM4RHggGIwrJ9m4kD1Nyyd3P2K
	iCQf4qHG6G3bgqO3eg+bA==
X-Gm-Gg: AYBFou3jyc4dbTaZc4U6Ocyq+bcmz6bhuNGiwXXdw3onfeSyFvM4Ct2mtLyrD3APm3i
	5JKkNHZA/ITvYiwVlS5O7tg++CeTleysKXbkR05dM9oD0TgcgU6nII1tCrrjGPwBsEOXLc+Evpg
	gCUsx8zGt/Jf7qn3Y6u9Hfel5mc5/5WrrrVNbXVKrqaFjKc06dELGVQJJQwcRwZUV4JTCnBVCGw
	AigZSZMThy18vP+RgYO+nsl0HL1T+UaVVBGD1HCpFeQlwbibKzw8Q9SgQD6uMVtffrlxV9yMVal
	cAZGYG50E0NhOTbEK8+uEtkkBBx139qkE9mJ0VEVlMubV+TzrLeh/P4DiBc93Y6kfEAR4RvA6Vt
	ari1NxuG40qkJB0WPDzHYS4r0HnftrqxwHVhH0qNYdbkNZRwR6urXQTRWMJHWigrv3ZdfSbw0Na
	P50FgXOFHe7PsMtr/eSYneyRhAjvrpoG3tuAS/dTUX1w==
X-Received: by 2002:a17:90b:3884:b0:396:6344:3b63 with SMTP id 98e67ed59e1d1-39debf6ce65mr7972587a91.2.1789416270603;
        Mon, 14 Sep 2026 13:04:30 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39dfdc39bdbsm283194a91.2.2026.09.14.13.04.30
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 13:04:30 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90e8dd8be81so48264166d6.0
        for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 13:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789416269; x=1790021069; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=++FAD+vvqLJLnQF1OXQZPWPJ1aNaoKmbxXpG1ktiVXY=;
        b=ZDwPS0rTaIOCiK2uLiztizUEyCVC6+a+/SPeUdg0mrqhFI4sf0a8GR2+aMnnZnVxXd
         1C7aE0rg50e0x4jWjLithO+Ilf0CLgIQ4ccVTTIfSpchB2dssyeH1KZTYb/he4KF+yNc
         abtSErwcgH1Ca86HE0NUHEUSAxOTAihHDQ838=
X-Forwarded-Encrypted: i=1; AKwUvBw+P4/xO0RheeZixSIsXbOIqDTKFPunOWrF7E4P/ZkTs924edaaXSLdfqjz+3pgFvbtMJC7QOxwQcw=@lists.linux.dev
X-Received: by 2002:a05:6214:c69:b0:910:7026:3f9d with SMTP id 6a1803df08f44-9122e55387amr65693806d6.19.1789416269410;
        Mon, 14 Sep 2026 13:04:29 -0700 (PDT)
X-Received: by 2002:a05:6214:c69:b0:910:7026:3f9d with SMTP id 6a1803df08f44-9122e55387amr65691016d6.19.1789416267213;
        Mon, 14 Sep 2026 13:04:27 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f47a6ebsm103068516d6.22.2026.09.14.13.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:04:26 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Jason Huang <Jason.Huang2@infineon.com>
Cc: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	wlan-kernel-dev-list@infineon.com,
	Carella Chen <carella.chen@infineon.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH v6 1/5] wifi: nl80211: add fast roam offload extended feature
Date: Mon, 14 Sep 2026 22:04:16 +0200
Message-ID: <20260914200417.1744264-4-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260911065656.1269623-2-Jason.Huang2@infineon.com>
References: <20260911065656.1269623-2-Jason.Huang2@infineon.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Fri, 11 Sep 2026 14:56:52 +0800, Jason Huang wrote:
> From: Carella Chen <carella.chen@infineon.com>
> 
> Drivers can offload FT or OKC roaming without necessarily advertising
> full 802.1X 4-way handshake offload. Add an extended feature bit for
> that capability and allow PMK configuration when it is present.
> 
> This gives userspace a way to provide PMK or PMK-R0 material needed by
> fast roaming firmware implementations while keeping the existing 4-way
> handshake offload capability unchanged.
> 
> Assisted-by: GitHub-Copilot-CLI:gpt-5.5

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Carella Chen <carella.chen@infineon.com>
> Signed-off-by: Jason Huang <jason.huang2@infineon.com>
> ---
>  include/uapi/linux/nl80211.h | 5 +++++
>  net/wireless/nl80211.c       | 8 ++++++--
>  2 files changed, 11 insertions(+), 2 deletions(-)
