Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827636;
	b=LxTMGH9pRXJjTAYeDh+V7Zx/TzazuhDfJGG+Q/Mt6G1LuwP8uXJCLg3bVKvrdyt91NI2
	 SSE2DKu1zqBCZfeixpiWOKdn3/HMbftFmFfmad4eB9ADDstPakWjHGRNA8rbrutyBNx0Z
	 CDtZ+/F4qgAZ3VmHRJt86Frmyass1XmiY7ng/RPNIfRuD1CQjdLEBy68+QcHEvcnhTI8Z
	 aRMb0lDmmiEBY3T6wOC0/EF23OH6hkiLIw8ouyfMzUV3PihxyTn48GHG4r+w9dtwH+yGK
	 VJV65wF6XTp55Eq+4aaBAjXNsuCj4c+KP/DoNS1Dzm43ltiE40LMRw9Ib+sIkcPBYbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827636;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=gHPvQ0sAZosva0WODHRcSIIzv8Mp2UeBjkPyFqt5BkU=;
	b=KpE97bO5tSGWFk59n7K55PDPkcPpyqyx/p/Tv8KgbM/c6K9JbC7ZA04SDYstxH0DPJTx
	 aJX+VTcYqH+BhN6ZeJwv0acML3yIgXz8D1pZIIFEF3bBMp+QCUCOvAeYiMPYLAXSpUvFJ
	 0Ga4FR5bX7s5DZhPNZ5S5eFo3dyYUnxSzQBOevDQrkTK6z5K3WQBCGvow17jaBMxgRuWz
	 +TTzex23VG6EUF8zyuZwJWhlu3K/j+gODE3JnBCe7OwjzYe+cpo2FgOModZaaFOoJBLRd
	 RC7vvWNmR2Kcj/EN+vQY3d/Y52F1qDiQ76NMUdV4oYOpqlvke6ji+PcCY1C/3PTqKWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NawwuK+A;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FE5606A8BF
	for <brcm80211@lists.linux.dev>; Mon, 16 Nov 2026 11:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36FE5606A8BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NawwuK+A
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so3895142a91.0
        for <brcm80211@lists.linux.dev>; Mon, 16 Nov 2026 03:13:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827635; x=1795432435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gHPvQ0sAZosva0WODHRcSIIzv8Mp2UeBjkPyFqt5BkU=;
        b=NiLRa6AqVq960v4ITnMXeyzwpYcJmNL4YPgQM3iYltg60B/CMyr8hH2ymgAe/9uxMy
         rD3fJqkn6aOczGO554+Q3XiiKxyve9AqeQ3DWVRukCquW8rTyun8YhtyPKHDlIf7CpNy
         WP04+g4apWBlO1Hw/iBrEmzkRYRdswP5cPXKVnkl7o2GAulmRDawaq7uJwWh+CrORiJd
         BKlGFNiTp55e0Np1Ndz0X3+1TU8wpPTQwNyLtZvHBiLuYF1IftSksQ+RBc/zpRCztIaw
         L9BzsT/pQIyG127pe0BALTNPd6N39T1F9FT4S3n7bObhxscJxY+Ss1BxXofqyqXhsC8V
         tg6Q==
X-Forwarded-Encrypted: i=1; AL+hErEwZU3p4sPC6qyOik7oRhkmdyXHj9JoMEF916J4WCGCWsw2fKHXiRWmmrNM9vcLcUzeaf032rGxqgI=@lists.linux.dev
X-Gm-Message-State: APuU4Z+siH8R/Pm3cr35mmrRKz7huiezKlneWEIja+m0kx9lcwvLG4Bj
	fDBqKAfT9QoAgO/mf3D3PuUqb06aCv2dpGrePRoHAVsTTW1MB1BT2E0GmsxzXGebg3s9ERP8zQ+
	YJtnin7+ZOl5bC2is3YrL4znPHnmZgPGoRmYijRFMzDzrjYoY+A/H0KTZJm5262qLZFgGxnGCzI
	D3218zsUPpH0N7Us1nmLaGhzlYLDzwQ7WYtMbxldxPo9wvh+thQg3FSm8DM78S+DsKprW7W2eCj
	sHr1OS7Tj3kDF2h77USNw==
X-Gm-Gg: AZFdTZcT9jMyljLGnIuTLfV1iPCupARO9ASdghkYqXGDFOEj4OzAir0uaqLkWDQvvZX
	dApcH/KkoSKkwc5g1mloJ4Ytsfkg+loiS3pJkO3Fge1ksU6eZYZ/i3FDR/7nTRoKngk8Qxa2xJw
	15zQxzNKyadplp2YBgP1JkzgnwqHF262YSgTKynbZtSAlwptiVimlGm/RdrT3Xwg4RqpJo+OUCc
	+LZ2tLX4XOAM6JxSsqJeexSUX+O4jo5C3HyqPhQ5/h4ggDYZkOzIR7nfFpYoRPcSQCjbMq2qZDN
	yfjPwJZPW00PDkHEEpax5YYxWKg/3vfuujZAm/qjAAnv/ID5i6T1YqBj7f0Rv9zscHvW//DG1fm
	qPd/EkZ0Q5zz4f7aTLN+zDkvdvoigr054VLlyHkJTFlfm+mZk1bz71FHyF+GlOcTKYFj/PZLKGN
	10zmaPhWFCOkSlZh9uzM5pkmbl5rZoyS6uDUE2hOPKHA==
X-Received: by 2002:a05:6102:3eca:b0:7c3:6466:3155 with SMTP id ada2fe7eead31-7d64d8da06cmr2596426137.33.1794827324719;
        Mon, 16 Nov 2026 03:08:44 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99c8d31ffedsm861279241.15.2026.11.16.03.08.44
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 03:08:44 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495dd0f07eso562097585a.0
        for <brcm80211@lists.linux.dev>; Mon, 16 Nov 2026 03:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794827324; x=1795432124; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gHPvQ0sAZosva0WODHRcSIIzv8Mp2UeBjkPyFqt5BkU=;
        b=NawwuK+ABJpW4Xlf1v2QC+vonrcfMuRJWMUuE87T9OhZ9NYBdlTdAjC3dDMX5Jig0r
         J4g1eINlzokWxYJ9mzr0KHpjrKDD2a+RFBml+9lzbFHEJ0lnX8ZKN9rHr79R1wximfWy
         Ikca6PLVFywSbMw8AgnlnE9FXJqNOwpEQgFwQ=
X-Forwarded-Encrypted: i=1; AL+hErEvgXcPxMA8qdmgKKmvI9rfvxx31+4X+jhNwPV+do4IfVS1i3rGP2F+7e2WnAYuwQOs7nwOs25b85M=@lists.linux.dev
X-Received: by 2002:a05:620a:439b:b0:93f:35a7:cd4 with SMTP id af79cd13be357-9494bc708femr1401765085a.67.1794827323983;
        Mon, 16 Nov 2026 03:08:43 -0800 (PST)
X-Received: by 2002:a05:620a:439b:b0:93f:35a7:cd4 with SMTP id af79cd13be357-9494bc708femr1401761285a.67.1794827323573;
        Mon, 16 Nov 2026 03:08:43 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c835b45sm825384985a.16.2026.11.16.03.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:08:43 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	sebastian.reichel@collabora.com,
	Lukas Klizas <lukas@klizas.lt>,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH] wifi: brcmfmac: reload the firmware after a missing D3 ACK
Date: Mon, 16 Nov 2026 12:08:39 +0100
Message-ID: <20261116110839.4481-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151616.70623-1-dev@deq.rocks>
References: <20261104151616.70623-1-dev@deq.rocks>
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

On Wed, 4 Nov 2026 16:16:16 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> Since commit 6f88e6ebdc1a ("wifi: brcmfmac: Improve D3 substate entering
> timeout handling") system suspend goes on after a missing D3 ACK when
> WoWL is off. On resume brcmf_pcie_pm_leave_D3() still takes the hot
> resume path when the INTMASK register reads back nonzero. Firmware that
> did not answer D3_INFORM can do that and stays dead afterwards.
>
> [...]
>
> Record the missing ACK and force the remove and re-probe path on the
> next resume so the firmware is loaded again.
>
> brcmf_msgbuf_delete_flowring() waits for outstanding tx status before
> it checks the bus state. Check the bus first and stop waiting when it
> goes down, since the firmware does not report tx status then.
>
> Fixes: 6f88e6ebdc1a ("wifi: brcmfmac: Improve D3 substate entering timeout handling")
> ---
>  .../broadcom/brcm80211/brcmfmac/msgbuf.c      | 22 ++++++++++++-------
>  .../broadcom/brcm80211/brcmfmac/pcie.c        | 16 ++++++++++++++
>  2 files changed, 30 insertions(+), 8 deletions(-)

Thanks for the patch. The resume problem is addressed by Andre Eikmeyer's
series "wifi: brcmfmac: pcie: S3 and deep sleep on the T2 Mac chips" [1]:

- Patch 3/5 ("probe again after a resume through firmware") sends
  brcmf_pcie_pm_leave_D3() straight to the remove and re-probe path when
  the platform firmware handled the resume and WoWL is off, before the
  INTMASK check that lets a dead firmware take the hot resume path.
- Patch 4/5 ("send the flowring delete without waiting for tx status")
  removes the tx status wait in brcmf_msgbuf_delete_flowring() that stalls
  the flowring teardown when the firmware is gone.

Your patch forces the re-probe on any missed D3 ACK for every PCIe chip,
which also hits firmware that never ACKs D3_INFORM when idle, such as
BCM43752 behind 6f88e6ebdc1a, and logs an error for an expected case. Note
that the msgbuf.c change is a separate change from the D3 ACK handling as
well.

Please test with that series applied. If a case remains where a missed D3
ACK leaves the firmware dead, send a patch on top of it, limited to the
affected chips, with a description of the failure.

[1] https://patchwork.kernel.org/project/linux-wireless/list/?series=1208304

Regards,
Arend
