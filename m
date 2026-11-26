Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703391;
	b=dIco/tn4zgyhAYueIstwBlf657CQmb5kh2i4PNLBxk5u1+V7TiuHpySiaeZDvHlRo+dV
	 JU55HzaCcaGky3HA1/oTnkKuNMlOr1jOmVUTWdDrNL/SCb35aCryUsRmL9SxLFDuUdEnE
	 x+ZrwGyzu9A+/ICP+slbH0b8GJf5D0lIrsa2oGsPqggI8PMtn18kMEgCT6iB3SpC/IFei
	 gU5emUnx+v5ETLcw3ctf3jk6M3TVpq45RT+zmQIKAlgcWY6F/qADZI7VTN//k8bm0rVxa
	 O5g7NNWknl2/wMaGpUYU8ihe0G91xvHJCQWNFc8u5j2r6i3CwzatmA98A20UgrwCP4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703391;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=R9AqjUS/CAqhaZ7UAgXTn4tXqW1wVTJDC+c9fuKtePc=;
	b=tV9EDqbjW3NSKvYy0wmguK2qvEXQzifOE///NpDaO0Xe0b5fRAU/VrKUdxWRGQv0IULO
	 oNGh3ee9U+IK5V6UpTBUOV+qTjTXATqtF2rOQgqNIwkNtGSzp0MRH0OMTb/j4OYvGkpAX
	 SKfmPG3xRGoyqFnXsYc6mF6a1OVXwcTmQSs8QGnnEA6CjLB1kkQs9gCfm7KbHFuklOYRS
	 nS3RhFJOnvxD9dGo1QGuRrjPrxEi/6wG5f9U/vtxlNaTDsiH5qATY/4QgGhcrnsg0wnWg
	 iXPNxroPjNx9bI7mfVN4Ea7UVd4hKloBOFYluRlxWqk0nONVSGNn9/aZyN0hC+8ctxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=K8gaxPOS;
	arc=none smtp.remote-ip=209.85.214.227
Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C050F606A33F
	for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 14:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C050F606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=K8gaxPOS
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2f048476ab9so49801435ad.0
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 06:29:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703390; x=1796308190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R9AqjUS/CAqhaZ7UAgXTn4tXqW1wVTJDC+c9fuKtePc=;
        b=onITuzLNiidMtkHvv3EjBAydep2lGZSbL1PItQfZLVNR50we6mHzSr3QdjUK1QGyeK
         eLLzjenhWEi2QPOjLMafPsM6ikrt8/KmzONrshGNByAKe9GGPdR5giLHPO0NWlBs84wm
         eClcwDAbVEYhEoACiFPansKYDGW0fgJIH7KCwKkkuEP2DjbUBF4CwfiDq63T6A6eyXdw
         gO+WfR5FEX+p/0Nofn3yGkegszgWDCbmVN9JyF/Q5+5PDqC4yKMlyQEvXmDyazVQNUIe
         2Bjq1GSqrEyyn0k2809TCf28Alx3F5+uuyHDk4LScQg19uLqSlv1ti0dl80w/YSkk/Ir
         Wa+Q==
X-Forwarded-Encrypted: i=1; AL+hErG2jPIYEHMaSCPhLuJaVLJJxrqBJabCnCWTy0wBVansbjndXM0eY3SHGcs2Zp/3XgjvPnEFVxUFWJM=@lists.linux.dev
X-Gm-Message-State: APuU4Z+Rw/yQkFvYkFXhK+MHFu/JjJeXNe4bHtiFt2PG6SJaaY/Y+o07
	BLU+wkzlyN7xgVa+9MqAcPAw1j0MmZsC2lgO/AOaQyhV9+ryV4N0yTtZnuUjRVHdQz0dEExbExz
	mMdi+Fplv7/c6QEyTVXMLB2Z/UoNQvfb6yKvN8zfdhkGZO0WC/NJEjHVbu2ggh/gfcSMKLpQ5IE
	BgDhQZM3Tf8EvP1RBZ83D4Yw9dNhZ9oDPImJPU8kROZRMUbXK3WwA1CmQ3+PJqx4WEpguiH5L4W
	srZhtOBF2wwoyr+WmTvKA==
X-Gm-Gg: AZFdTZeRpl5/sBc1AqsleOQroZCQQNtiIxCPwjktBz9QZjzByCJzNqxBgD6w0gGNWGB
	MHbOOumlw3SjIFySR3X0TyDWfeCIUMXMQDSfixEe3GqewcGtEYu4reevCofSoueaHG1jL+4A/hk
	1MyMKjTvHN5zGYgqQeXXBRRNvjgLUf+UXtu9T6Ly1ZQ7xX0l3RtrX9DLawgzF4WDahAGQ4OesZn
	muxifT3c6BUEk+w+mMqwQ5X+hpW/UKVajLtRYwqlhkxdLQ8NVMQsn29PyDUEslr9wL9tzdAAqwq
	qHLqE/JGKa6fE7j5pNpN8QTSW5RyVU74T6r0Of87BDYVTaqX9a0bNb381AWDHPC480w1ZN/33qh
	m8DOO+ZnFMQp9XRwbKuatOb+J0K4V3/XWnPW3ry+F7pAGm9CfHyLAQ+4wInC2HNzvVMdHdIzfeX
	jcS0dlwnsLfHZzzFxyPcd2K3sAVV0qaIxXTWogmV0=
X-Received: by 2002:a17:902:cec2:b0:2f0:6576:2815 with SMTP id d9443c01a7336-2f0657629aemr178742415ad.1.1795703389954;
        Thu, 26 Nov 2026 06:29:49 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2f03ef0e4bfsm2854395ad.8.2026.11.26.06.29.48
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:29:49 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9213e04641dso137101646d6.2
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 06:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795703387; x=1796308187; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R9AqjUS/CAqhaZ7UAgXTn4tXqW1wVTJDC+c9fuKtePc=;
        b=K8gaxPOS9aACIhjvthXecsCQtylaGAFuTlXvrj5w/chjk1a6SjWfIA8VczkSSuwnWp
         TmbYjLU30+KRPGN74aOI6GV9DKc9wu7ZLn8ifeV0D3zJrSalDlYmUejZS2lYinnEiVp3
         xPK6/kQRj+wpgWpNXeSlnXeJH5z2wow7/mN+Q=
X-Forwarded-Encrypted: i=1; AL+hErHx3XApNChpyrxlp3LKODuUU1LTSiL/Xc7W4iKfAWWfEp2GVqHCYhVOYLdMX62ALjYXGP3i/ChA8HU=@lists.linux.dev
X-Received: by 2002:a05:622a:228d:b0:55b:afbf:aebb with SMTP id d75a77b69052e-55d76a1f00fmr401901961cf.24.1795703387401;
        Thu, 26 Nov 2026 06:29:47 -0800 (PST)
X-Received: by 2002:a05:622a:228d:b0:55b:afbf:aebb with SMTP id d75a77b69052e-55d76a1f00fmr401901581cf.24.1795703386998;
        Thu, 26 Nov 2026 06:29:46 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788506b0sm181098511cf.17.2026.11.26.06.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:29:45 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	michael.reeves077@gmail.com,
	marcan@marcan.st,
	j@jannau.net,
	asahi@lists.linux.dev,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH v2 1/5] wifi: brcmfmac: pcie: set the state before D0_INFORM on resume
Date: Thu, 26 Nov 2026 15:29:38 +0100
Message-ID: <20261126142942.881504-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111120748.23795-2-dev@deq.rocks>
References: <20261111120748.23795-2-dev@deq.rocks>
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

On Wed, 11 Nov 2026 13:07:44 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> With the mailbox on the control ring, D0_INFORM goes through the ring
> write path, which refuses to write while devinfo->state is DOWN.
> brcmf_pcie_pm_leave_D3() sets the state only after D0_INFORM, so every
> hot resume fails and falls back to remove and re-probe:
>
>   brcmf_pcie_send_mb_data: Failed to send H2D mailbox data (-5)
>
> Set the state before D0_INFORM and back to DOWN when the hot resume
> fails.
>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>

Please add a Fixes: tag for the commit that moved the mailbox to the control ring:

Fixes: a83a99d063a0 ("wifi: brcmfmac: Negotiate PCIe mailbox transport with firmware")

> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

You may add my acknowledgement in v3.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
