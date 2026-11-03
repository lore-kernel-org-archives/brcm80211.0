Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714357;
	b=CxVYbGEvRwZchx7CNw1zSZkzU5W+6UKHES27SvV/QL9SUjpmnOumne6w7uEagSxDDdH6
	 xNi/WiLUG+bBneaFoMV8x9mfODWWU7DqkBeulRJIVJUWFbOYuMAutZ58x+RzoZbtYBxOM
	 BFYswc815+IHPcBXOxoS9s65okKvufpNqFuVTG5Kpaur2qidweW96s77Fi5jt0A4Fh9RJ
	 MWNjAu+geKOw3TkVxxLXcB5Bo31NgNUUJMDF6LFRK/zLNueEELkHIRcMWIUiWnxuERhgO
	 49DNEFWaKynMp1FN2Nm9lhHiFDhZBpdCzEx7X8dFZqYmxpXcIx45KFyb++7VKxXDJig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714357;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=cvUJ5Fu74/yRvPGwst9m0ry7+LODDEe2Sn2iPk6DIvU=;
	b=gAcJpSBuu6D7kq97nWN4ZAmo3Z4W8OrNVEOfURcq8EPgKGPoVATHdLBqj+TL+wQ4TgZW
	 c+9phYinE1GXVV3FpyzMA3e7oWS9vmFhEWvq35g8KhnrcvN6CG7My9SXmVVkAml4C6hnN
	 OU3eSys3NWd7raXk1NSDQeD88jpkRbpQZ1ZRww7tucY/RGN/cbUJPPH5g1BPxO+HfCDRF
	 231Gqp0TmOCAIg1APTeg8LLgjtH7SCk4x1s4dFHaAtIhrnTwR2SpVWHi2yNTV9V7dbc58
	 wni7wnHfo8/Dab9wkXZct4179SiHo4n3hVftAzlDvmm8KaS1Sd/tZv8fLS8mCX74XJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WaYNYr7z;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06877606A324
	for <brcm80211@lists.linux.dev>; Tue,  3 Nov 2026 13:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06877606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WaYNYr7z
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cd8ca57ef64so318041a12.0
        for <brcm80211@lists.linux.dev>; Tue, 03 Nov 2026 05:59:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714356; x=1794319156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cvUJ5Fu74/yRvPGwst9m0ry7+LODDEe2Sn2iPk6DIvU=;
        b=QzCQ/jaw5qgGKIOq05HaXCESBQZwL9kX5jvD6gTf37drOJQ+XZyNvb4XvDhlkUxl37
         F9HRPv75/vMuL/MeOnrr9u1N2BHVU18vHq8qERakxevDhIJDXzcvKs4Tk5J+eoAr1jAb
         hA8DmHvq2Y2jGWm8g9es6MPKQCsexYkGZuBSkmRoLO3Eqegv2Qciac/p7npPq5FEI4nL
         JtsiSUkKDl/ZX7y1uLREet38h4wJCwwuL9bsAlEbLhNbUCLWsAHz3zXkjZUrPJnOkB2o
         mP2bK2jrFvxXFPza+EzXyDHi7qzIZE7qSX2g/Ln8mEB3xMMXAZBRtGQJ3sJE2BSmadQa
         UF8A==
X-Forwarded-Encrypted: i=1; AKwUvBxVaip30oPOLgHwydeXaGr9AGjzEF2R9u3Kk9BpzMcCwci/YD9mmY97tMcNjCRvD5Ehws9KwVp9edM=@lists.linux.dev
X-Gm-Message-State: APuU4Z9sIVTXRVFc2XHz+v4YkuFJ6PCtXNhqKtN3IkL/+bfa3GEeJ/3W
	XhwrYfPjb2YvrXK4wVLrtuF2d0aysd9wUW50b6HJkIsF3JxzV4jOG4pwm9TVTmx5aEACsNVF6fN
	2NYFqabR+4cCmzYVT5arGBvWqSHftgpGIeKon0/w82CwgDPKLmQorDVoFzeDF0klAVOxxlbR5xs
	tH/qfv6BV5h7QiPlwDSwXx+j1IGESPxM1sgegILQqHRJfrhxv5OA4txUKJh3FSFuN46r8J3FI2d
	qM6ItrdEMtC7ybT1nyeMA==
X-Gm-Gg: AYBFou2YoogZx6S4R7QlYMp1q8RFZHA2T1uHa4BKh19r22Ab5K1828juf3DkE3YVyJx
	7CU8nN1X8a9TLAjJijkPOTZFk4eXvRlUSUTI7VM8Wfqhq/2VdXhXIQwJDNitCUWu7/wyeSo693u
	iUaBfzvnZ9wB2aJATp216a7W9s+JnFLMSqKyJJ9E0IuG4cCJXSgBuwILXk71KFDBRHu9/V635tQ
	Qm4UIPp/l4MuppSjTvCmxQwbBhyMLPse5/Y1RcVqgB/nyBZsWEk/QZPrlLifmvgkgpm0MjvrXfK
	lpLw2+tvwO3lxp5R+FkxXaN3xkpzQPFIW9ETGWBDXBrCDDUXegYTKUx3d5zaotg6kbqsHFSxpW7
	utCO6nJvOlr9CF0mW7au/xZ3ZYspSdj67kYZy/aLGetskpkWm/1vnwPwDXivyiCGBVs/RZNVlig
	xQ4eo5tSxV3sKT9IbjUomNX6jmJS8lXGMVUVdCOwY=
X-Received: by 2002:a17:90b:2f0f:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3ae896d7af2mr6867002a91.8.1793714356289;
        Tue, 03 Nov 2026 05:59:16 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b087409c51sm974201a91.3.2026.11.03.05.59.15
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:16 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a26fe9521so770084eec.1
        for <brcm80211@lists.linux.dev>; Tue, 03 Nov 2026 05:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714355; x=1794319155; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cvUJ5Fu74/yRvPGwst9m0ry7+LODDEe2Sn2iPk6DIvU=;
        b=WaYNYr7z8pJuuSuvyVFkvOpCnD2rvJY5d87fChS2Xxy6RcM8VaV/0YghbibA4kW+cr
         aIwHctwAx1Go3r8jOaKJ0Nie8rJCHFODwtABxzJB9Yele4aI+psSS/jEBw/wuuj4qZQb
         MGzNaGrya/wxqOUBbJ2RSVMbKerxnblmclEpY=
X-Forwarded-Encrypted: i=1; AKwUvBz6MwNGS9HJq8ZNCLW4QJ/Osp1gq36WZb00WVreRwwavRfNWx4uiwEmNZoCkR3GcUgXEj43JJV9aMo=@lists.linux.dev
X-Received: by 2002:a05:7022:7f0b:b0:1ad:1574:aa9d with SMTP id a92af1059eb24-1ad1574aab4mr16954571c88.0.1793714354620;
        Tue, 03 Nov 2026 05:59:14 -0800 (PST)
X-Received: by 2002:a05:7022:7f0b:b0:1ad:1574:aa9d with SMTP id a92af1059eb24-1ad1574aab4mr16954509c88.0.1793714353901;
        Tue, 03 Nov 2026 05:59:13 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:11 -0800 (PST)
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
Subject: Re: [PATCH 02/13] wifi: brcmfmac: Match complete firmware capability names
Date: Tue,  3 Nov 2026 14:58:46 +0100
Message-ID: <20261103135856.3676311-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-2-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-2-b5cbc2cde2fb@gmail.com>
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

On Fri, 25 Sep 2026 23:43:37 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Michael Reeves <michael.reeves077@gmail.com>
>
> BCM4388 firmware advertises "hp2p" without advertising "p2p". Substring
> matching incorrectly treats "hp2p" as P2P support, causing userspace to
> attempt Wi-Fi Direct interface creation that the firmware rejects.
>
> Match complete whitespace-separated capability names instead. Remove the
> trailing-space workarounds for SAE and FBT and reserve a terminating
> byte outside the firmware response buffer.
>
> Fixes: ec64241c9fd2 ("brcmfmac: obtain feature info using 'cap' firmware command")

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/feature.c   | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
