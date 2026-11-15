Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776586;
	b=L82ri5Omj+HTycOqOT38A0ep9uqaDkQEFDpx6RrDyrz8F5qfzKzH5i3osfB6bzP7qvC1
	 byeo+FJ4wFxcbz3zbDiENN6xIJaGId+hqmoyonEB21tQNyPOfZd4Kp1i5yEGs3cKmST8+
	 IOSdkDDO5LytiP9/YBYY3WDtPUCVWsM+M7YqoMynsSO0XR581/huViR2liE8HdUPRecas
	 eih29oGRtkY6D2MvddAjL2Fo09YfBmhcIImpHG1PM7/mhIxgfa9ksSgvsK1mNmux/G+zQ
	 Keh/lAKVqr++2zdgVV08142S7UT9haHpiLvNhCJH8qFIw5O/zToRFQnZ5L0OMRPSxUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776586;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=UWIlSlhDqIZVJylV02U3W5JWNr4VF81Iz41rAjFMs+U=;
	b=Ul0KoURK35qKwyttcMJPVnodiNadfQ/z2pTKQmTcXdp30orYj+JU6q/18TQcnCLD5X8b
	 Wx0LfFrGsnINZJgn2PqKnQl/BfOHKL9mPVQjG4HMhQJjxkQAehCBEuthro2e1o8szNqpN
	 0wTiIZtV/LCSBHYrcjJ+FN1aun/4seTRxsZZgEtf/tXmSFq5snmXiCNG62CeTYva+PdFG
	 xUwC90zOXejtpdihJ/mOff6Am9O8AHMehFmYv1YhStYCvaN6I5QoLkcRwZNdn7VmyZuDn
	 bfBMFCK+4dZwuJL0B54vZKfJbYo8KhXmAZMjNd5GiyuTPJoJnLe4yj/tOfJtGDQUICg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hoG8Axge;
	arc=none smtp.remote-ip=209.85.214.226
Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2D9606A329
	for <brcm80211@lists.linux.dev>; Sun, 15 Nov 2026 21:03:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C2D9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hoG8Axge
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2e95bd1c14cso35550495ad.2
        for <brcm80211@lists.linux.dev>; Sun, 15 Nov 2026 13:03:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776585; x=1795381385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UWIlSlhDqIZVJylV02U3W5JWNr4VF81Iz41rAjFMs+U=;
        b=CGSeI8yZTpx0VVJVTteiHCAik4v4O6GZNSKy/C+3WTdEXqTddRukP0Ln8Lr4OS59gk
         I/Y7AaOonz4br9TW1PzgndbTma7g/d+rTZPSakQGuBUmcSAJZNc3kVGBunwq77ytEsFa
         6+np8x/S9GlAx1qZWCyYpd/xLtdehoNR5iZ4h8zXk7EfszheDG3E5br9qkd5zBtZOR7t
         YQXzQU/uP9Otnu7Eh08XhyappWKkiUpWw5omL9gsXKuiyRCMigyj2K85/6CGrEh2oHMw
         9Ts25GZ/i615PmjAjIviLitDqN+Mvh+R9LreYQv86JTcr94JOGJEh7x1ZmtoODulU1kN
         xsMw==
X-Forwarded-Encrypted: i=1; AL+hErFLTrnYD2P8OYXOO/sQ7Fe3j+jjhJvTDThjkSc4R+FGZT94CZjvm66hVjUTGKnGlSrDelAonr1Z2MQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z9J0ctPIGe1lkYO7jZ0R0ZkSWERQ7vGC6NUV8R9Ef7mU/xFV7aj
	iQughs/kPldGK+ocS6FHYVUI76KSFehRqGcf3JIouVlQPLvuy1AtyDXdcEH0KcVy/LirdQNB73P
	Sfow8QeJvhJAbzDZPDf6XGi8si6s7TfrMt4CzMMWZFQzHothcxzsk0XpeK239kqCj/GZVX2/UJt
	1W9Q4805D1z9UtO0E5Erp5g9EqjoE7t3PWoXwLXIVze73vTBIKERg0/vo2Z2Ddkv811SEoq8wyE
	SfU7cIM+4KNit5xMJM=
X-Gm-Gg: AYBFou1P6C9pJXIx6ukYCqsOZXhGiIWGzP5y2PUUs427hOirg0oAb+KWMXmXwhjAFUp
	AiZToSZLXmYAj5GYS3uauLrJjJdOzp91uBvJa7kE66UKt8cS30Ptc/YyKWWGN9P51gQ/YjwQQI2
	3tnMEQSz06ey1w0pW3Pdj4cKqFPMr+xAOBn1hcSjs4Cz4aNik0KeKbp8m2ZppkHD3GQ2eQe6O93
	v3O0t/48+SKvmP3Aebkm++Tasue7MSFZbsqC1cwbTN1k8Ax0CmKb2lkKNOlWm8zS7uRO0BeLmkP
	fWSDQHGIMbT2MtZiWlZ63G8/VMAlKwyGJcA/O/EQRjMlc3bEnKmDq7LeEj2VE6VgtjColemP2Rh
	Enp3KjfQnQBS+dAK0bXGMtzwoVObkLOu4mNUc7jfvw5Yz9Egv4prjzpTtkyZAg6Y9fttfeYZ15K
	WrW7C7PkgCGZluwWp5dcr5SWyFEwbcgpcfyH46qqyO4A==
X-Received: by 2002:a17:90b:1fc4:b0:3ab:188b:c5bf with SMTP id 98e67ed59e1d1-3b1b0b57dc8mr8441934a91.18.1794776585411;
        Sun, 15 Nov 2026 13:03:05 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197ca0af1sm12690969a91.3.2026.11.15.13.03.04
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:03:05 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-370230d93efso589041eec.1
        for <brcm80211@lists.linux.dev>; Sun, 15 Nov 2026 13:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794776583; x=1795381383; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UWIlSlhDqIZVJylV02U3W5JWNr4VF81Iz41rAjFMs+U=;
        b=hoG8AxgewiTHfK43rUXMwa5pMBpf+UH6m9g68900AKE0bgW86lKxpPwDBGpavTsza9
         xaN7jo/bxJ6YbUTN0R/tGO3ioho25xPrVUSTtdnUmXgHCBy9SN/nkdUyTrsE/5dD5zwq
         L35d4DXZYASl2heW0tQCvaNyvZXgehvA+3dJo=
X-Forwarded-Encrypted: i=1; AL+hErGpGYTikbV5Aflb7l6AZksY60iWQJERMdd3KStptLeAUacvp0ejPScKRn3jt+tLJwNs+axXGxQ4bI0=@lists.linux.dev
X-Received: by 2002:a05:7300:dd03:b0:36a:437a:4c00 with SMTP id 5a478bee46e88-37967314a08mr7970687eec.24.1794776583544;
        Sun, 15 Nov 2026 13:03:03 -0800 (PST)
X-Received: by 2002:a05:7300:dd03:b0:36a:437a:4c00 with SMTP id 5a478bee46e88-37967314a08mr7970660eec.24.1794776582638;
        Sun, 15 Nov 2026 13:03:02 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d3e37sm31068797eec.24.2026.11.15.13.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:03:01 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Vitor Soares <ivitro@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Fan Wu <fanwu01@zju.edu.cn>,
	stable@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH v1] wifi: brcmfmac: skip bus_reset cancel when the work was never initialized
Date: Sun, 15 Nov 2026 22:02:50 +0100
Message-ID: <20261115210253.883721-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261020203916.381637-2-ivitro@gmail.com>
References: <20261020203916.381637-2-ivitro@gmail.com>
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

On Tue, 20 Oct 2026 21:39:13 +0100, Vitor Soares <ivitro@gmail.com> wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
>
> When the firmware request fails, brcmf_pcie_setup() releases its own
> driver, which runs brcmf_pcie_remove() -> brcmf_bus_cancel_reset_work().
> At that point brcmf_alloc() has set bus_if->drvr, but brcmf_attach() has
> not run, so drvr->bus_reset was never INIT_WORK()ed. cancel_work_sync()
> on the zeroed work then trips WARN_ON(!work->func) in __flush_work():

[...]

> brcmf_bus_schedule_reset() already gates on bus_reset.func for this
> reason. Apply the same check on the cancel side.
>
> Reproduced on a BCM43752 PCIe module with the firmware file absent.
> With this change the same failure path completes without the warning.
>
> Fixes: 43b25879f004 ("wifi: brcmfmac: drain bus_reset work on device removal")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
