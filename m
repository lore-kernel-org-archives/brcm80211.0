Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EF24078D5
	for <brcm80211@lists.linux.dev>; Thu,  1 Oct 2026 23:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790898118; cv=none; b=a7usjcMc+FVD3wKQqI6Av6ERX2F5RzyoT8NqvB0/EvEHAFMQ4ry3JACxJddlWrtRFsFYATevIrjlc3zguqCJV2zIzGR6JAotNxlV6PYxb3xs7oNSX203NaVE7i8C6JmG9Rj9J0dvj3gbGZ/F7QqnUOIMIznyNuDIl0eay1OjIww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790898118; c=relaxed/simple;
	bh=k8FV0AuY/UnTXAbRfnvFY/B3Ch7+YNxyw8EB7UJBX+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t3/1a1kMrGFRpvJpaUd7vT/uxABMlLS2RnS4WvN/dzN0Lia/4l6737z5vdRoVT8hnWwM56tIrTvSxH+761AMle1rJARVLSTV1C0rpqWp2s8B80RoT07gpPpOq1dcntEfU8GrU4u9mZ1B2+b7MkBs7FrLOnVl2K3C3eikLaD6I20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FMLIIbAi; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FMLIIbAi"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so44243605e9.1
        for <brcm80211@lists.linux.dev>; Thu, 01 Oct 2026 16:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790898114; x=1791502914; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x2eHfLXSxsUxHEfJdm6K8VExNqrOwW+s9I9FDdxMVoY=;
        b=FMLIIbAiPzlsnix93/cCf1VKjys5a8KKNljj3+Rev9npFQIeBg1EIViqImRlZYKvy2
         YMmh/Pr9W4Xq7ZXjMpCqZ3HUcW5EDvnzV5aI8iL355Cf6Vv1upgRkZPLKB8EnxRTe7TP
         menvyx3lInXIEcwkwke4wiG87r7/sVTVg6ABPlAxC8cha8DzpthRczaCnqFrngps3R9c
         SW1fnsxG0xtK5trdLpL7+7uWUgXHRGURoqU0HK4vUbTOOefHW9QHaFc3/HYJaM5/FFSv
         Uy1MrH4hssxR1cuCjh3XukGzcb0deV09hy4mLy3/gX73Z4veO9qagO3WjCWurgASJPTT
         oGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790898114; x=1791502914;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x2eHfLXSxsUxHEfJdm6K8VExNqrOwW+s9I9FDdxMVoY=;
        b=1Mq1PLIiN9GOAzYJPKRJhMxS0sjL461s9WrdmdEco7li/hSI1TYbvvCTpSIiPmVcCl
         8que4ySnE93qfE+EDQUintDMJOKMqVaidXU204ixv+rS+eiEebNALPPBTbvKHeR2eZyo
         +SBmDFbjlsJyl+ukszvgK/ewMPPvaPLzapEzz8hK4OoRx5qJP2kSiRfzc0aSlhculGEq
         kU13zXEm5rJf3wKIwDOmxAnyJlDxCNeDaJ14qWGncaZJ5mwGGINLfhIPhL1LqFgFZuqC
         7XwNijDyBskIRLEPIt3lP2A5cX8PlTeLsCx+DjWT2JXKQcFq2OgKJltpThf+vRdLYtQc
         pHLQ==
X-Forwarded-Encrypted: i=1; AKwUvBykMhEokmqWb2BacjEPYX1mqQDY5F6byfes2VyMhn0BMK/X9fq1wnl+bfNCbVARDVmFAATPom5pksc=@lists.linux.dev
X-Gm-Message-State: AFuF++l7wOeRGopyDBV7OChDd0iQ3XxpcJ7umSaETCfo6XH7RogxN2bu
	mGgidWMR4/NuWTAZ6FDrBHstyVvVSL0pfrQY1a4HckviNpxr+DiIZBtl
X-Gm-Gg: AYBFou1hcDyYxeaA+Bl+1R/peONXEmxo4R96PzDLIO1LvzO5bjPoFxU+Y0+W2Kl5DLm
	jHWPqEqhJdrVMyxEw2LsnSH6tz6FnEExZqxT1d2Naehs2Te7nrveIz+OslNV3IEznaaLQAuQ6xQ
	jqszZidGOWeuZGvOL8pTnizb2TOj/gYT//YfyWaXz6HHzeNIi95ijk0+IgMxyMs4NkAKE4MmyeX
	1g1ZuF0tjlOYbPRk2s6rTTVSNzPT2J7iXyRBjRxWTsjdyW36MjlyqQJLvF5Gie60mPV6h0f96Nk
	g1y++NdkGHeiRmd7DMdmNV9aDP6NIi0LIQmazJOyNTc+Rmxt//kLveCGSG3TvVcPhwXMUPbxQoS
	8SmrjztjUOoDqlYzzUoiD8jn1RgWHR8VszY228huWXDQLT0j5kOvu1907TDvHOCdsX+MH6IM1SX
	UxIEDR9HDu0r/KztesDkdaMoXkSclfpkZ9PmfAwQfP0O1qzWUSYIUrkNnYLXHC7dC4Xy8T8idYg
	RXYMJbab7MzvTt9S58Hnla9l3T7gX2hsk4v1sV02gCQm3pIVRRXM/FZK86EuqKJGWjf0HvehVv5
	Y346itwFej3d7adRreBsQuBQERU/+w2Ix2kNWtvpp3zYix5oCb3GGu4yqiwOMiajBREO9f34UhD
	YgDFncf/bTA==
X-Received: by 2002:a05:600c:620c:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-4a027583fb0mr16121105e9.20.1790898114308;
        Thu, 01 Oct 2026 16:41:54 -0700 (PDT)
Received: from MBP-von-Karl.localdomain (dynamic-2a02-3100-b3ca-3a01-3deb-81e4-0dc4-fbe8.310.pool.telefonica.de. [2a02:3100:b3ca:3a01:3deb:81e4:dc4:fbe8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280dc6e7sm30779645e9.15.2026.10.01.16.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 16:41:53 -0700 (PDT)
Date: Fri, 2 Oct 2026 01:41:51 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	g@mbp-von-karl.localdomain
Cc: linux-wireless@vger.kernel.org, 
	Arend van Spriel <arend.vanspriel@broadcom.com>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] wifi: brcmfmac: avoid sleeping tx locks in netpoll
 contextg
Message-ID: <ar7vLt5kQ2HJoJY9@gmail.com>
References: <20260930185417.61865-1-kmehltretter@gmail.com>
 <20261001075755.3MilPS2C@linutronix.de>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001075755.3MilPS2C@linutronix.de>

On Thu, Oct 01, 2026 at 09:57:55AM +0100, Sebastian Andrzej Siewior wrote:
> On 2026-09-30 20:54:17 [+0200], Karl Mehltretter wrote:
> > This fixes the direct SDIO transmit path used by fcmode=0. Modes 1 and 2
> > take the FWS lock first and need a separate change.
> 
> Is this the only affected driver?

I also reproduced a sleeping-lock warning with 8139cp on PREEMPT_RT
using QEMU's RTL8139C+ device. Enabling a dynamic netconsole target caused
the printer thread to enter cp_start_xmit() with hard interrupts disabled:

  BUG: sleeping function called from invalid context
  in_atomic(): 0, irqs_disabled(): 1, pid: 107, name: pr/netcon0
  hardirqs last disabled at netpoll_send_skb+0x1c8/0x3d0
  rt_spin_lock
  cp_start_xmit+0x31/0x8b6 [8139cp]
  netpoll_start_xmit+0x18e/0x260
  netpoll_send_skb+0x37a/0x3d0
  netconsole_write+0x56d/0x820

That was one reproduction on the netdev base a7bfaba4823e. I have not
established how many drivers are affected.

Source inspection also identified 8139too and macb as candidates: their
transmit paths take ordinary spinlock_t locks. I have not reproduced the
warning with either driver.

The earlier netpoll/NBCON discussion concerns NAPI polling and
scheduler-lock deadlocks, rather than this driver-lock warning:

https://lore.kernel.org/linux-rt-devel/20260618111554.2n0pP_O9@linutronix.de/

> Do you have maybe a backtrace?
> 

This is the original Pi 400 report on 7.3-rc3 with PREEMPT_RT. That kernel
also had unrelated allocation-test patches applied. DEBUG_ATOMIC_SLEEP
was disabled, so this report is the BH-disable warning:

  DEBUG_LOCKS_WARN_ON(this_cpu_read(softirq_ctrl.cnt))
  WARNING: kernel/softirq.c:199 at __local_bh_disable_ip+0xd8/0x200
  CPU#0: pr/netcon0/769
  Call trace:
   __local_bh_disable_ip+0xd8/0x200
   brcmf_sdio_bus_txdata+0x90/0x2b0 [brcmfmac]
   brcmf_proto_bcdc_txdata+0x90/0xb0 [brcmfmac]
   brcmf_proto_bcdc_tx_queue_data+0x60/0xa0 [brcmfmac]
   brcmf_netdev_start_xmit+0x164/0x390 [brcmfmac]
   netpoll_start_xmit+0x160/0x218
   netpoll_send_skb+0x208/0x2b0
   netpoll_send_udp+0x298/0x478
   netconsole_write+0x440/0x7a0
   netconsole_write_basic+0x20/0x40
   nbcon_emit_next_record+0x208/0x2a8
   nbcon_emit_one+0xc8/0x110
   nbcon_kthread_func+0x184/0x210

Thanks,
Karl
