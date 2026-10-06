Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9812D2E738B
	for <brcm80211@lists.linux.dev>; Tue,  6 Oct 2026 04:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791260357; cv=none; b=iYg/QHDsrSbdcjY+f2C2kPspWDZs97EoNOjlcWXM0+R4mEEvJXSQoh0ejKe4jJ1VbX86GG4A515ynh9YgmuyKrzZv7T6TL/X80Ybv6rG1y/0A0Q0u9TuRdxgX1UBiDy0SBqBNQek5QOuOmDrka4FpRNycGCYGeQ593OR/O3/l+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791260357; c=relaxed/simple;
	bh=k3RSUY4fxdXMS3ZnKpvJScrf6J75V/fZ8Jp7axykJk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aENv8NW3++BgphdDj6But5Bby4V1XstznpF5T4sjE485ZlW07smKnZA9jT05FcVvAPVztz+2drZF6muP0G7JPFozGfwxQRi506JWM4JAmpzTfpQdA2S5FGehtdhLs749NzASa/agtbAqiVpuwbxeXtNkht6ZoYAuTGqy6324YQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/OJwP8W; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/OJwP8W"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so2896935e9.3
        for <brcm80211@lists.linux.dev>; Mon, 05 Oct 2026 21:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791260354; x=1791865154; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b4cq9NsXa/9Ah4XIfTqt/umKWCh8D9nJZ3hIc35Disk=;
        b=e/OJwP8WBqHKfSnSHW+nvZza5jU2UnzFhhACOc9DLYvPPsR+0n0Oq+KA5ziXEPXFuz
         pE+SC7AJZ9DqfHBKWYV6rhylRA1twlaxWfpm3sIbVX4i1ipBV8i/D7vG6kqFtzAWdo+t
         4L/IUco9v8hIrEx9LbsPalbrDa7MSznmbOrkU6vySgJ9DlSMnNM7XryDt6lAV9qqn6Zu
         +p+tA7hRA73zzI7OPGHA2K2Ej3qmLRT/660ECarRS/aVPqP6Vx8ITpe/Brbr2WP4WpWf
         9fB4TpVU63piAuPULQgpe4RilabmFd+nXI8yvKl2A68gvf0CvVoO8ZAZM1lcm8OM60H9
         HCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791260354; x=1791865154;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b4cq9NsXa/9Ah4XIfTqt/umKWCh8D9nJZ3hIc35Disk=;
        b=AkXbILEhuKxsL9J3LQ3+pL8Y/JZGT8QBJIweIC9GLE/rYGZJXPBzlsS+z04o+6nKxd
         Scz9AD3zTQf0tnpKvqIvUZ83gKN9UnEpUY2uC3nIPOG0wov4qGuWUUrclcMy+d8uGjG8
         rqmPBI1Xu75zNdVZp7uVpm0pt3gnFiH5C5XEvyu790Zk+eZxkFDiZsB2b7DViOD9Y+cj
         FuVwtnKuS3j62A6RVxuuIZp4y64k8CYYmg8a0uo39Dny56501+Up2pygZYPLhEmRCF9b
         01NDQaFq85+VMezXWwgpKvomJwqsYvAFe9W4IN5Av7tNS1/OYC2FbkwhvI1tIQ7ezCb0
         yy9A==
X-Forwarded-Encrypted: i=1; AKwUvBzUiJpp9s/afD+fNKhx/Zi4tVSXi/VCK1cshbfw76BwA6r0BrI4aoCAzrj3z1rnW9aP/NykcgzqtdY=@lists.linux.dev
X-Gm-Message-State: AFuF++m5uQGyx28hX/qbnM7ByqevObEMkBq8tuHnquMeu2YUsV2B4aH5
	JXsG96WWp8QXUAheIFYCz0RvqXGnhpAW9/hrrSGhMCgANw9i9V9+6N6e
X-Gm-Gg: AYBFou2VWu7i4DTiV33bBbiOdUVmUw5nq1kUFeebduhS7kPLQ72kfGQnhXeTuQUj/mW
	SKFBpLz33ERKI7A3ZCFPaSFlQP8v+jYvf5kQFQqL0OdCBMLOAQDsJZh+MF8yTQKseFwbuziANxZ
	NrjRdoSM2zl8HmiUd9aOFkzXzOl9cMGtjfcPl96ZE5zxkE0T5G0Vd2fRf7SrJVI8eOD2I0vmkoG
	o8IsPXwkzq9N/b62BYo6E91VBwtFQg3TOMV9ro96v+X2KGog4KFdprIS0cVjZ9GrdUG/feOBeXX
	q771M9d8Y9I6vGjStoCDiAx7HSXd/X4NhkSVLeqqoq3l7H7PGiBNzfI3KOIpTVyF6khGx+6kAbr
	ptyMJ6rRmX8LnDjFec8Gqxk6wByqmHVX7Lf4/l1/XKdGbVZ3TYyYJoMKbp1dnHm1WC9HkuosV++
	o70jMRY3lTcU0vlQzTLkJlRAes3T9fWNiBV7p0iiLvoFNyQeX/ljVhacTAkauPn0Omx9rhEuSfk
	+GxogGYPqOZxVwIAYjeo8TxYNdL5Ro/TaE9pEsV+1CVSxV+gdcdRk4TOlSY6YJLGX+5m1isMTzZ
	OUss9krN1CwvqIcZjveU0bbOnwH9vchbFw==
X-Received: by 2002:a05:600c:3510:b0:4a0:1c43:3c04 with SMTP id 5b1f17b1804b1-4a17b53e298mr3201995e9.13.1791260353780;
        Mon, 05 Oct 2026 21:19:13 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-095-117-040-097.95.117.pool.telefonica.de. [95.117.40.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1776cfe45sm44826795e9.1.2026.10.05.21.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 21:19:13 -0700 (PDT)
Date: Tue, 6 Oct 2026 06:18:41 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] wifi: brcmfmac: avoid sleeping tx locks in netpoll
 context
Message-ID: <asR1TaKQJlPFqEvR@gmail.com>
References: <20260930185417.61865-1-kmehltretter@gmail.com>
 <20261004122910.1392318-1-arend.vanspriel@broadcom.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004122910.1392318-1-arend.vanspriel@broadcom.com>

On Sun, Oct 04, 2026 at 05:29:10AM +0100, Arend van Spriel wrote:
> Is there an opportunity to reuse/refactor brcmf_sdio_prec_enq() rather than
> adding a separate brcmf_sdio_prec_enq_irqoff() helper? For example, passing
> a can_evict parameter:
> 

Thanks for the review!

Sharing the helper with a can_evict argument is cleaner.

One queue user does not hold txq_lock: brcmf_fws_bus_txq_cleanup()
dequeues through brcmu_pktq_pdeq_match(). 

Lockdep instrumentation in fcmode=1 and 2 confirmed that cleanup enters
without txq_lock.

I combined the helpers, but kept brcmu_pktq_penq() for normal calls.

Karl
