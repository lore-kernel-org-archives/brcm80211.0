Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F9B421F0F
	for <brcm80211@lists.linux.dev>; Sun,  4 Oct 2026 12:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791116948; cv=none; b=NDaiaDffDDjOfBw1V1CICixH0CvnX8hOgeW+e2h1/X58WvGbEH9XwtzfzoWEsqVlWUrcfZiRi9JBSgV0m/Dm5eFUkvCJzSpi4wTpf1mmiRxQ89aBO4UlyExWQ6Nm489/Q7hpKmoR/0dp6pnEQrIhSA2iJZQr17BzROQgQgGNuOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791116948; c=relaxed/simple;
	bh=O8AOb5QLaO7btcj37/Ldlt4sf7K5LubilbX/lofAehA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RBA2MkJ9m+L66AEk6EDg8pfpMva7KbXmqA2xjHx8krp7NySfkepzjAfjK53EFUZ8RAwWzMrNVbBKzgZ2ewP4+TYhf+vgMN04O2R3H3eERhK4f4aGHC52LV4XtYnGGGz2AnQV581OEmGtEG3X5LGiQo93ScwKio933mBfbxC/HKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LWi6JPHE; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LWi6JPHE"
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2e49fbf92aaso868055ad.0
        for <brcm80211@lists.linux.dev>; Sun, 04 Oct 2026 05:29:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791116947; x=1791721747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lFxRZe/WwmbBPaTtaFu4NCRozMGI6L0mmZzZk89wk58=;
        b=HyNHdhppRyDTDd+gmpCo5PALOe0VTpOu4IClv4vxb9mkzGTfbntADIIXWYVK67mfy7
         UyDhGHHgQRV7OZv+ngk+n6k7UxCoCIZrLHL869ZYxE54b6ZkjcGUyxcaDfKs8IGWjkQB
         VNcJSWSKV0qKKXA24aVEj/gxz7UGQD/X6DRtbVwONqQLeuP3Mos1UDm48UyCCOHUzqmh
         +NlnVK80HvhuaJyhtDhc9dbg2flmu5saeBPMiPhgBAVz7VFKG97JaHCjp/3NmjrHrQu2
         VPpEl43cfkpeNLE0aS6k/7EL24lKV6Fm3ggIONXM0N1T2Ac9hVytz7YGiiTH87O3t6qz
         uWEw==
X-Forwarded-Encrypted: i=1; AKwUvBzWFYPVri+tgRVC9FOhcuwPas5PFs1S+moKfwdJHylP/6rS1RIqaiZwf9Jt7ED5jvz4ArZdMKCl9yg=@lists.linux.dev
X-Gm-Message-State: AFq9FYItUn9lXRJau5C5J8mAivnv9ajeQ1XHuFpCoJcZX0+I+1d5RYB7
	qI/PUKrLaVdykv9/RrCZSTW7kzgtv3VXAkvD/1gNdVZruDUIDQ3n9cJMtsEs6QKwDREscYBVlPr
	vIOEs4NyU7KqE0yNQ2e4QcpxDbGEeMrGsgMrxDpEA+6IMQVo+fJY95YAJrM66Tlxzzm0TukkWVw
	paUY0TNkkm1LhO+rPID9P7hMUQEHUy0wK/B3/fvuGF6n765ECbyN0f/BCLa0e8U/sEwK5AbLAZQ
	UHtbRE9hHPvcI8LhaplKQ==
X-Gm-Gg: AYBFou1mdJSWhna2fEzX5imcnAh0tJMsMEB0i5Th9W3jtYatDo0NegzswNuYtcHKmd1
	PLVakPvlsTZ+7TRfkPrtTyVtGGKfnmRhglT4nhguB9QPP9K9/wPPt+g6S3eggerzMrsLYQN7gLZ
	M66I3awpqM0P3780NJx5jQdEiehARrOD4l+Sg7FFF0njwzJbo/t1Acd9Coq4tJQWlc57ZzJwrNX
	iILvoSTB8wapzKLavmaPra2Q9c34T+1vWHioF2Uxw4YGeunPwpm1EPgFZaR7/jM1xSqyAdlCj1C
	tCiFDwcQKgUcYW/Z/1VeTe5+qHmAF3sl1peRtClEXcSrpoAifdw2x7hhcVOHUOUKIp9KZakUwBo
	+DtbQ9GluHcUQ2Jhh6H29a5FV8asUxbcOqvMy1KK4Ts7gUDCd954NILOV6lZp996+1fJECb6Y3g
	ACnxLaWd5kEkdBtoL9tuDJexVIU1Pi/N30qQ89Jic3ug==
X-Received: by 2002:a17:902:e746:b0:2e3:913:31a2 with SMTP id d9443c01a7336-2e49b7ee18bmr78590465ad.66.1791116946806;
        Sun, 04 Oct 2026 05:29:06 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-ccb741a86c6sm1020346a12.7.2026.10.04.05.29.05
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2026 05:29:06 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34bbf2e3c5cso1967658eec.0
        for <brcm80211@lists.linux.dev>; Sun, 04 Oct 2026 05:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791116943; x=1791721743; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lFxRZe/WwmbBPaTtaFu4NCRozMGI6L0mmZzZk89wk58=;
        b=LWi6JPHEDvjobs3hW8FuwHaO3d8sXLsg45JRQ0xCAjIUI8nT6fz8NrgWfW1vxBCRwD
         tQG2XCl+H5TNfcvVSemr3FLhLf4AaHp444Y1GfbgvIHS2Gjs0UcJS6XaL1rk8qm+wXXl
         j1Jwzv3yck5h57fjEP/t60rvBWtUot3oWKvHw=
X-Forwarded-Encrypted: i=1; AKwUvByq4ZavyuUobQlO38eD2Ucj0Cnjo84K9S3vs5rEWeMK/vxWzcg6Pf+n47l6th4Dcdgsi+nY686giPI=@lists.linux.dev
X-Received: by 2002:a05:7300:d518:b0:34b:dbbc:a72 with SMTP id 5a478bee46e88-34f2185446fmr13565328eec.24.1791116943588;
        Sun, 04 Oct 2026 05:29:03 -0700 (PDT)
X-Received: by 2002:a05:7300:d518:b0:34b:dbbc:a72 with SMTP id 5a478bee46e88-34f2185446fmr13565295eec.24.1791116943044;
        Sun, 04 Oct 2026 05:29:03 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3512713861fsm4656855eec.10.2026.10.04.05.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 05:29:02 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Michele Dionisio <michele.dionisio@gmail.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Hante Meuleman <meuleman@broadcom.com>,
	Fan Wu <fanwu01@zju.edu.cn>,
	Kalle Valo <kvalo@kernel.org>,
	Pieter-Paul Giesberts <pieterpg@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH wireless 1/1] wifi: brcmfmac: fix P2P device removal race in brcmf_detach()
Date: Sun,  4 Oct 2026 05:28:57 -0700
Message-ID: <20261004122857.1391917-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260924123027.4122909-2-michele.dionisio@gmail.com>
References: <20260924123027.4122909-1-michele.dionisio@gmail.com> <20260924123027.4122909-2-michele.dionisio@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/24/2026 2:30 PM, Michele Dionisio wrote:
> When the driver is removed while the user space process that created
> the P2P device (e.g. wpa_supplicant) is still exiting, the P2P device
> interface is removed twice and the kernel crashes.

[...]

> For the interface without a netdev (the P2P device), take RTNL and the
> wiphy mutex in brcmf_detach() before reading iflist, and remove it with
> locked=true. If brcmf_p2p_del_vif() runs first, brcmf_detach() finds the
> slot empty. If brcmf_detach() runs first, nl80211 does not find the wdev
> any more. The interfaces with a netdev are removed as before, because
> brcmf_del_if() takes RTNL on its own for the primary interface.
> 
> Fixes: 9831bcb987df ("brcmfmac: Deleting of p2p device is leaking memory.")
> Cc: stable@vger.kernel.org
> Assisted-by: claude-opus-5-5

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Michele Dionisio <michele.dionisio@gmail.com>
