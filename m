Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826401;
	b=5Fm8lftuvnUFR1MYmXyvKLo5/f6LnbvhzzlrVuESJxdsJP6ALd/hfp+e2Y/BPOHAGYHn
	 l0v58nuIrOR8U+R3AB4MnYfcFav2MbDsuHO2sgc1dk+cWESbwRi+XofZot3tNDjZBNKrD
	 7wHGTC7MAoIqpkGAb+IT9pCMtqnlPSdCv9Y9robKOx/YPgkIwN0MtT33BJGXl/sil6Jdq
	 b+oX8Qr3HrwPqa6Z82dMNbb+NN2EDkoHAXRDckA4kapDxTNKegxTmgSluVWZ7fI3yu9uP
	 IPqqFCFopC10mJNm3uzgrRGd7QM0ebI7GPsP+axh0on7kTLwT7fInfBAkyQ6BxBpfJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826401;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=HVQaD9JPLSlypPeoMjV3YW5/MfO3VO8SRm2wJMatWzY=;
	b=swXDH4G+dV9fxCNirVlu1fOyjS+EjOwCTUs7vJQVpLxoI+nTQ4ad6v3Wu/yrMjZc3aN3
	 Y0tsexGCY8xiVGhdeKGMS9bQNNGHTC6FapBCpli3WTnjr4bkY8JUJme+i+8ruXR06hTmO
	 d1BJvOOvUO/mWlW69rXPIvjX68AOcKU/joesTMLg5MIA1ZIvRvAoROJptAUT2yMeitNl7
	 pqDBUUA9TDItXPIIG9d3ylxrnWWIU1CSDbEPEy+Sc0zGM3ag8jESUQXK7byPNzWfUrke0
	 t0APQvKUDodJsRRuhhgMAdZMzBtRRW6CVMEvk+T19JvSRWT2lo7k0YwStKtUa02XTgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=emtwnsho;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0157606A330
	for <brcm80211@lists.linux.dev>; Mon, 16 Nov 2026 10:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0157606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=emtwnsho
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdb9d5c1c8eso2203688a12.0
        for <brcm80211@lists.linux.dev>; Mon, 16 Nov 2026 02:53:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826400; x=1795431200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HVQaD9JPLSlypPeoMjV3YW5/MfO3VO8SRm2wJMatWzY=;
        b=luI3HZT1ImznM5zW+TUdY7ZMgZR5vN3uY+4/JGH1i1z7lp6WyLvtkiTkwi/9r6pu23
         F1QW64ZH0FsQL5ktSWbPI53LpIJDmnsRUkhXgdmgDvcerpPnm8d+XOnqOxZTzcn4exsh
         HTLzsiYLSC0G+BLbZU1BlzEdbj0u5tCXrK++oJSX2H9TyMzV6X6hsQ+gs+PhmmmUVNGF
         1dyb89QDR4Ss2KhbYpH+wSHzTgsdJXSC0jJDkARaZp9kiZtjMGh+sCmp8PaqOKvLj6IP
         zbUUXClpLBJl/OreNbx+iFvhDNbFMPyAc5KD5LpUMo9HvJxN69pKsIkpSGwniwbqNxxE
         F9Sw==
X-Forwarded-Encrypted: i=1; AL+hErG2IoI7Q/a4/jUQMFJvg9voKr+E7+Oe/JaLN+dJEgAIGGKdX7qurzD6CA2EtOxD6sVWnMSHuKMUfXI=@lists.linux.dev
X-Gm-Message-State: APuU4Z9KahzdX3pHrh7UmDyftJvsaNrCymLY5rmW9lFRkHlzK3xz0pmO
	f6Mm4zzDK2yc6BcUOBBhPS+9P74yriBEYc6fg0Ad1ItQylTWl7OQSp8EAbSnUOBS5ReNdrdj88R
	F8ELPOfHKCJTctdYl432eXeaSg74hGDNXNh8fgCW91frcKZ4lxoHxC6oIFqM5LKwzzNcLbwVukb
	h8BAVLkZ2qg298yO+M7TS+e6GaYTXkAju3T51rKoqhvwzYGZ4jB4yS2KKasEjELAzJMkub7RyHU
	TdoehtuhpfqLlWgaP6qyQ==
X-Gm-Gg: AZFdTZcQVRvUqaaMQ635aHyVvsRpsg98+VaNZD0JAqpzzgDccjgZtto/Q1RFF+gd5Eb
	/PNTXLCs8MHKTr/LX6JCdCr8Vv87ppEi8yvmCVdl7dP2tBcn6AKkaHkSrOAO3M+OPtJf8hfXqQE
	bePvidGGZzUxw1ZIB6C65AZ0r7gWv78qgcWQ6bF+e4A/Ylj9LQQ7Z1Ri3kdLVJUHJ4RBitdyHgP
	+icOXwLDZLe6JS1SzgWppcoCs/Ste69iYHZKvyV7pttpVu7L4nhniEb438lCtpmJJhOUO+/KlFq
	p3toRv9JKuRF3Y0iyoTzwZFhb7YrnjVar8NHb538z3nByxMDbq0FvOE/dONBPAY7jy5By/l/ook
	5LSsHwqqTYcmKJM3AJUwPBIBg7P2UoNjm9zHEM9p9qzbDGdSB63DKJuphsinr6gPuihZKseD3dN
	Ln1ZnZl9yEw+l8a03dC7zrOL3NYudlfO4qsfyQOyk=
X-Received: by 2002:a17:90b:3f50:b0:3ad:c14:35ce with SMTP id 98e67ed59e1d1-3b1b0d98b63mr10370510a91.64.1794826399716;
        Mon, 16 Nov 2026 02:53:19 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b3af131bsm3551054a91.2.2026.11.16.02.53.19
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:53:19 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so222862285a.0
        for <brcm80211@lists.linux.dev>; Mon, 16 Nov 2026 02:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794826398; x=1795431198; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HVQaD9JPLSlypPeoMjV3YW5/MfO3VO8SRm2wJMatWzY=;
        b=emtwnshomaV0+2afLmAaDDufwbbmXoDrL5bswFU66mByjMC8O8JBYGCeL4cvXUZY5d
         6Nv8wTFWVN2fmXrZWySxX+iZVl9fnTxEgmOstOd35ezfgQ7TBlws6djX1YrPJdgDJmbD
         IzE8Y/chTywPe4+jooiHjYjSqOCkFAHh4bwmo=
X-Forwarded-Encrypted: i=1; AL+hErEVsNg+Ca7EYNp4UkKc6KAG6SIG0FIT3f9WAgPmj2xVvQI3+Cqrh9TNGBfREBMXJetKwKmXNDPO9mQ=@lists.linux.dev
X-Received: by 2002:a05:620a:4541:b0:945:afc1:a73e with SMTP id af79cd13be357-9494ba601efmr1588960385a.8.1794826398336;
        Mon, 16 Nov 2026 02:53:18 -0800 (PST)
X-Received: by 2002:a05:620a:4541:b0:945:afc1:a73e with SMTP id af79cd13be357-9494ba601efmr1588957785a.8.1794826397898;
        Mon, 16 Nov 2026 02:53:17 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949825e08b4sm125151785a.37.2026.11.16.02.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:53:17 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Kordian Chmielewski <kudzo51@gmail.com>
Cc: dev@deq.rocks,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	asahi@lists.linux.dev,
	j@jannau.net,
	marcan@marcan.st,
	sebastian.reichel@collabora.com,
	linux-kernel@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next v2] wifi: brcmfmac: msgbuf: count tx status only for the current flowring
Date: Mon, 16 Nov 2026 11:53:13 +0100
Message-ID: <20261116105313.3479803-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112175754.396469-1-kudzo51@gmail.com>
References: <20261112175754.396469-1-kudzo51@gmail.com>
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

On Thu, 12 Nov 2026 18:57:54 +0100, Kordian Chmielewski wrote:
> brcmf_msgbuf_delete_flowring() waits for the outstanding_tx counter of a
> flowring to reach zero before it sends the delete. When the wait times
> out, it sets the counter to zero with packets still out. Their tx status
> still comes and takes the counter below zero, and since the counter
> lives in the commonring of the flowid and nothing resets it, the next
> flowring that gets the flowid starts from there. With the counter below
> zero, the next delete of that flowring waits until it times out as well.

[...]

> Reset the counter when a flowring is created. Give each flowid a
> generation that goes up when the flowid is released, and keep it in the
> tx pktid of every packet posted to the flowring. A tx status of an older
> generation still releases its packet, but no longer touches the counter.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Kordian Chmielewski <kudzo51@gmail.com>
> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/msgbuf.c  | 36 +++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
