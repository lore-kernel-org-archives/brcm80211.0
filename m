Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D236147127E
	for <brcm80211@lists.linux.dev>; Fri,  9 Oct 2026 07:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531042; cv=none; b=RujZmElgFWgvKho/WrfWrQOvvEiuUhp9ebOq2Xcb4Jy+CeuGik0/HoZ60QcqTiNRUdQd49af1s9BDe1V1om3QIF6to/PpU4VfLXTwze6QAsKxBQyFxYMiemj60kxf+zows8a3Ud20hChvbBBuP1+3U1cX8tuf1IV7bCtZ9MsmYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531042; c=relaxed/simple;
	bh=m2sbDzTVz80zNixXWIi0WDat1SU37qeKuIL9ZzrWE0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8p32DxRoHY2hh6sZNi4lxkWx/4ZopRc94uddYZLVyrK9dJ1m+OcbHvHn6pnGWh+XTfFX4yPuf6JJg0eL9Gt215C07lJOGC6fhExq+UMWmICxSay9J2NHSZuaIDx8nUjmX8AEw86383+uo7OGTO6i7El33PFixlLTg9bIZFg6Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KniNOG1b; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KniNOG1b"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso55302355e9.3
        for <brcm80211@lists.linux.dev>; Fri, 09 Oct 2026 00:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791531039; x=1792135839; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QhfdgCnusoug/g1d4W12Bzr39jd94gg5/ulsL7PdlMY=;
        b=KniNOG1bZhU3dl8ZVtnDHPyGblC+2J3zP1Z762jwv0yFqRh2J+DArvhiHJUz3uku+S
         JIEqF7QRtZNcrxtAmIgfyBXIjmBUfpfY3SJcMYUfK3EPxIT+kmRKfqvKrZ390N++bJj5
         c5im7S98+bNeH80NrfGE3jTTa9ByN/ZVYsBnpFn82O9nGqFG4aseWqACBArv3V8ojdoX
         iEsUi00oMOQi1y31KYs4cVSxUQ3wx2vZTsVoF6BQJapNsI/igJNtHocDtlsBrT8zpSew
         TBFP5AO0dR0pT/u4gMUyzkJ+zyYF32kXCgUVYIwqULkwAkbuIPxT6eqtEt5vy1AVRww5
         iM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791531039; x=1792135839;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QhfdgCnusoug/g1d4W12Bzr39jd94gg5/ulsL7PdlMY=;
        b=BASedlmlbcRblCWc4cKkwhYpMBcV142ASpsZ55Mkcl3NChI1R7RLopkr4dMBkt9tyS
         qJtnN4Ll6yEawRNLEaitQ1lswu0fSx8/XUyIEK/sUTLkzNiPR3Hyi5zFlD32rOSVS5/a
         KeKV0qHfb13ifFP52yzhA/xU6trgQAYhVGE4KuQvuK5nUT1SRkrEIF/ht1ixG9uANEfO
         Z9hDLZtLCzWep/IXMPANLMCMiTOVLZisJ+YWbOxYHSUWkXCBxZUB5ABorTX5UWSECXPL
         JQLeg50Ztbbl88QOI0MyIjqS+6kh6pL8BIAgSNdQ5VtEyqTLqJfLqa9oSyB8ZOKim0Q8
         IC3Q==
X-Forwarded-Encrypted: i=1; AKwUvByi+kJQIG86Dtz+7pXoDXmb7YtY34jOn/bRwvOzu0YzJ/eQL6JUT2mP0IHe1l8hihTv63Ihi2KztQE=@lists.linux.dev
X-Gm-Message-State: AFuF++mHKqOpjLqqDYKwZW/dKYg3lV35j116SjmVbI8e5XqmWnhDFx0s
	1cL++gBDdO6RnMdMA+mkB1lix4jsr83sJ8+UFc4BGv89fFT9mtnehppE
X-Gm-Gg: AYBFou0qxsfdVG0IppkIvObTyIubWi5A4Em3ZQ2L5MHStwlhsd2o8Rsbo+uj9qLS1AH
	fGoe/DT2TPrNZ2k7+kwB2z46VYn0FLkOPO717Ca/n5WB5NOHezz0RnhViQQAC5RQn/qe1dmpc0e
	c9Zp34bGhCkVEY4AiSxOz1EtzsbW+MSoLfrtzval5PDlscbIaYABAzTkS/YVITfO5Qe/GefETck
	t+OqefVNF9oB1djkzERKKdaV9yCtGbijxD21TA/yRIoQ2oz2/pp9DyiNXnJmahj7+qa1OAsMCZ6
	FEM9nv86tkI2wFAB64kWDJgUJtyqo0kbJmyxJ7Vm3MA8CsXMNUOgoiVZPSzOUrfkP1rbV0PXUnQ
	nmZbUxECx9+9CuHnF5o+prmgLWI13asl2C/eqYJYELUuo0O66yQ1u6EXYe1NpUdZGWXpTmzWwdn
	tN6i/PGw+BsWYeP3jrQJ1o3k180cwzQL8S/BbUiZiEMYVx6lGLZ2hdaXfvEuGNOXkqfG7lhhOYY
	DYxHHlXG67/7nxiPMPR6eQjAjiwDcreGRQpyKlXB77n241XJr2oBckSVy98hNskkY/DcIe011zv
	DeoGYozRFCfuV86/yQTgt0Y/a2OCEj+/zVfxwEFPVDO+fh67etigfts87oHyPqrOXBFc3aCCDEu
	b
X-Received: by 2002:a05:600d:82c6:b0:4a0:1fe2:d4c8 with SMTP id 5b1f17b1804b1-4a18e4a4c3emr19524635e9.5.1791531038809;
        Fri, 09 Oct 2026 00:30:38 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a128-aa01-297a-7094-853e-a20c.310.pool.telefonica.de. [2a02:3100:a128:aa01:297a:7094:853e:a20c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf31b83sm38426495e9.12.2026.10.09.00.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:30:38 -0700 (PDT)
Date: Fri, 9 Oct 2026 09:30:37 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] wifi: brcmfmac: avoid sleeping tx locks in netpoll
 context
Message-ID: <asiX75kRueyFqWuO@gmail.com>
References: <20260930185417.61865-1-kmehltretter@gmail.com>
 <20261004122910.1392318-1-arend.vanspriel@broadcom.com>
 <asR1TaKQJlPFqEvR@gmail.com>
 <802a092a-314a-4f77-aa1d-134b3d020069@broadcom.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <802a092a-314a-4f77-aa1d-134b3d020069@broadcom.com>

On Tue, Oct 06, 2026 at 10:27:27AM +0100, Arend van Spriel wrote:
> > 
> > Lockdep instrumentation in fcmode=1 and 2 confirmed that cleanup enters
> > without txq_lock.
> 
> This is an observation unrelated to the patch, right? You mentioned in the
> patch it only covers fcmode=0, right?
> 

Yes, the cleanup observation is unrelated to the fcmode=0 fix. I
mentioned it to explain why I kept brcmu_pktq_penq() for normal calls.

I'm looking at a separate brcmfmac FWS-path RT/netpoll fix for modes
1 and 2. The prototype defers IRQ-disabled transmit to the FWS worker.

Are modes 1 and 2 used or recommended on SDIO devices? That would
help me prioritise the follow-up.

Thanks,
Karl
