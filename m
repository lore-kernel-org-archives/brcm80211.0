Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5310F414421
	for <brcm80211@lists.linux.dev>; Sun,  4 Oct 2026 12:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791116934; cv=none; b=gjQ67N81XpcboJ4h6DjYDcSTZhMJbg+Gwuw2VYgofReScctgFCrrIND13u8cGzCOS42goPGWxDXPL1cv1wONsA4FcffkRd4JuhuTjGRXO2p5eDDml+R7KxXkC/aiWGKcwS4dZFFFMi2RnmY0MsYAuoJmQvdAoodYrHKWOuV9pPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791116934; c=relaxed/simple;
	bh=uqTDGLpLDiZjJGXJ7cXBmigd1ujQhtoqRZW9qtkfopQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JKQ6RMyxfhwc//GOwBUAZgLxIlNBiqJGq1qHhAHeIkNsIb46eUEOerjtBuySK03DRjRabRc15GqeJgYK3ca3G33rl28VLLvkkO3vVZKk2E1gRrb8af2bH9S4Y07QEIq4WghZ0PjRWS1PrswQ/F/F1fm5rRDZE4Jzu46q3te/0f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=QQuqkMPU; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="QQuqkMPU"
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2e4a341d177so5413715ad.0
        for <brcm80211@lists.linux.dev>; Sun, 04 Oct 2026 05:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791116931; x=1791721731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=48VB+6X5YIGbdqE6rZBZu2Xgbztijhzm4Tc1dAueWso=;
        b=X1nboPfUQEP//XvpYhNnaXHvuF4L4h3hPwsl+hX9w9jOWm6pkNR47Qx++Njy/3MXyD
         L4FAGZzArv6jU67GMs38iP94GQY9O8jA5mOPu+Z9LuZAjcfESm+zFgWdX/5AQAKbTBr0
         8gd3KnnIXRVd9ust8KjJ0QyVbCagIWpvgfW6Ve9rm9FzoTgx3gTsFjuNNUnC6U2Fmp0t
         zaZjeC2WOxlup0mg1CAhOwzxbeXSdxAiiHm/uMCZXP2xjI1Afk5qcoyNpXkX88tuxeMX
         NBQiEdSWpLBt5zRkBJhKirBPBLSYqsJ2+r8HSuHOwPz9IH/xXxYupGcD1Wqf0/ldKFBy
         8Sbg==
X-Forwarded-Encrypted: i=1; AKwUvBxR8IIxGuoUP6SDIAP/gWClHfUZQuWnSt509ZiDDy1bCWIYd9UXR6N4HiqRd2WcLOhEqn3w6NdVgko=@lists.linux.dev
X-Gm-Message-State: AFq9FYInmCSXaaD3WbbtG/T3m6WHvJTmPZEvb/FK2xi6cKbM91k8JMbb
	xpxSCJCLaal1dB6C9R9+tFiwEnSRH9acEpkZbgmqRyP1PL4A2RqAVgH5s3hIWcU6QRnx6CB4ydr
	IxnmnUxPM5pXPBwCZzeZNDu1q0vh3AmmQqTSwl5T/ET/XDw82sssG0+A+x5SBZ+RLEy3WfgCEhi
	sWmQVkEatxrqXVN8A3pIWLnmnYiLflE0ILHXT8I5odJbTb+2LKoLYFO/GakgPWIhA51ZHvRMvqU
	1KE7p1wPzlAlCrDX5w=
X-Gm-Gg: AYBFou2BW0+VjNS1Y6BYKNS+VvbhWv+FgQ8JiRkkJG/NWUvlSquCIQaiEVi4Muof+7X
	ED5ZiNme2j/5mPlrU9J14NyRreeWqVTaRn36JqJNeBDW+MVnmBgZ0GPOq5f5AgfFUIwplH/CSmm
	+7oPIIeDe98wAYKzQrFWOg2z++M7WCgn9BAl+XNCxdLsBx5JxOL1LZ8Iq3e4m70HeBMlKKKvV8j
	ow4YOj3DxNRWiBSVqyAIee+146JJmPUhHUaei/aDeU9n6m9kD4/bC8IW+4dHi1VbgesFck2q5Uh
	3KWahh2gcj45N8+UVHedaUQzVbId/86oKA2TF+kiTexASewLHfgkLfg/38dUL4f42TFWMvk4WZE
	vlnK2H5ItZtqeAKJZXLLYnG7EvozElFpzJT9bP0M7ROPH0czdUivp3B5j2RGML0LrhsmQVRnKRM
	JydAW91+YVgxQ04WdL7LPK0NBuJCplS36c2Jx6e7pB0w==
X-Received: by 2002:a17:90b:3946:b0:3a7:ce3b:5554 with SMTP id 98e67ed59e1d1-3a7ce3b5573mr1251723a91.1.1791116931305;
        Sun, 04 Oct 2026 05:28:51 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3a78f189ebcsm849645a91.2.2026.10.04.05.28.50
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2026 05:28:51 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3510d0baf63so1937910eec.1
        for <brcm80211@lists.linux.dev>; Sun, 04 Oct 2026 05:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791116929; x=1791721729; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=48VB+6X5YIGbdqE6rZBZu2Xgbztijhzm4Tc1dAueWso=;
        b=QQuqkMPU3ky9gfLftXtXwcyDk6fjn/Y+/V6P1lWIRugNZOz1mJlNNYQVb1dnQcnvkJ
         dCkbM6m3LrFeLP+lkmnE1Ou1ObAqQYjgWJM/eSj9L5CjwX4YtuXW99dz+0s0Cez+wsv/
         ySbDtzw6d/ojd4oNkIBo2wR5vQrW/cKgjkTZo=
X-Forwarded-Encrypted: i=1; AKwUvBxNzz+ahEfMSYRRENvogGXMAsOn6qBEg7gThUtIlS9sOwE76HleSTYWPw+y7C2Q05rCfD8I3rtYwVs=@lists.linux.dev
X-Received: by 2002:a05:701b:2051:20b0:147:9ad0:cf25 with SMTP id a92af1059eb24-151c435c1eemr6422034c88.46.1791116929411;
        Sun, 04 Oct 2026 05:28:49 -0700 (PDT)
X-Received: by 2002:a05:701b:2051:20b0:147:9ad0:cf25 with SMTP id a92af1059eb24-151c435c1eemr6422002c88.46.1791116928821;
        Sun, 04 Oct 2026 05:28:48 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fc39a7d1sm12234015c88.3.2026.10.04.05.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 05:28:48 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Benjamin Drung <benjamin.drung@canonical.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH 2/2] wifi: brcmfmac: Add clm_blob firmware for brcmfmac43456-sdio
Date: Sun,  4 Oct 2026 05:28:41 -0700
Message-ID: <20261004122841.1391116-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260923203739.2560527-3-benjamin.drung@canonical.com>
References: <20260923203739.2560527-1-benjamin.drung@canonical.com> <20260923203739.2560527-3-benjamin.drung@canonical.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/23/2026 10:37 PM, Benjamin Drung wrote:
> On Ubuntu 26.10 these firmware file are missing inside the initrd when
> including the brcmfmac kernel module:
> 
> ```
> /usr/lib/firmware/brcm/brcmfmac43436-sdio.clm_blob.zst
> /usr/lib/firmware/brcm/brcmfmac43456-sdio.clm_blob.zst
> ```
> 
> So include the clm_blob firmware file for brcmfmac43456-sdio similar to
> the other firmware files.
> 
> Bug-Ubuntu: https://launchpad.net/bugs/2168109
> Signed-off-by: Benjamin Drung <benjamin.drung@canonical.com>
> Reviewed-by: Matthias Brugger <mbrugger@suse.com>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
